import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_managament_admin/app/data/models/client_model.dart';
import 'package:stock_managament_admin/constants/customWidget/widgets.dart';

class ClientsController extends GetxController {
  RxList<Client> clients = <Client>[].obs;
  RxList<Client> searchResult = <Client>[].obs;
  RxBool loadData = false.obs;

  // Temizleme işlemi: Filtreleri sıfırlayıp, tüm verileri alır.
  void clearFilter() {
    searchResult.clear();
    getAllClients();
  }

  // Arama fonksiyonu: Girilen kelimelere göre filtreleme yapar.
  void onSearchTextChanged(String word) async {
    searchResult.clear();
    loadData.value = true;
    List<String> words = word.trim().split(' ');

    // Filtreleme işlemi
    var filteredData = clients.where((client) {
      bool match = true;
      for (var searchWord in words) {
        if (RegExp(r'^[0-9]+$').hasMatch(searchWord)) {
          if (!client.number.contains(searchWord)) match = false;
        } else {
          if (!client.name.toLowerCase().contains(searchWord.toLowerCase())) match = false;
        }
      }
      return match;
    }).toList();

    searchResult.value = filteredData;
    loadData.value = false;
  }

  // Excel'e aktarma işlemi
  Future<void> exportToExcel() async {
    var excel = Excel.createExcel();
    var sheet = excel['Clients'];
    sheet.appendRow(['Name', 'Number', 'Address', 'Order Count', 'TMT Paid', 'TMT Unpaid', 'USD Paid', 'USD Unpaid', 'Doc Id']);

    for (var client in clients) {
      sheet.appendRow([client.name, client.number, client.address, client.orderCount, client.tmtPaid, client.tmtUnpaid, client.usdPaid, client.usdUnpaid, client.docID]);
    }

    excel.save(fileName: "${DateTime.now().toString().substring(0, 19)}_clients.xlsx");
  }

  // Yeni bir müşteri ekler
  Future<void> addClient({required String clientName, required String clientAddress, required String clientPhoneNumber}) async {
    bool valueAddClient = clients.any((client) => client.number == clientPhoneNumber);

    if (!valueAddClient) {
      try {
        var result = await FirebaseFirestore.instance.collection('clients').add({
          'address': clientAddress,
          'name': clientName,
          'number': clientPhoneNumber,
          'tmt_paid': '0.0',
          'tmt_unpaid': '0.0',
          'usd_paid': '0.0',
          'usd_unpaid': '0.0',
          'order_count': 0,
          'date': DateTime.now().toString().substring(0, 19),
        });

        Client newClient = Client(
          name: clientName,
          docID: result.id,
          number: clientPhoneNumber,
          address: clientAddress,
          date: DateTime.now().toString().substring(0, 19),
          orderCount: 0,
          tmtPaid: '0.0',
          tmtUnpaid: '0.0',
          usdPaid: '0.0',
          usdUnpaid: '0.0',
        );

        clients.add(newClient);
        clients.sort((a, b) => a.date.compareTo(b.date));

        Get.back();
        showSnackBar("Done", "Client successfully added", Colors.green);
      } catch (e) {
        print(e);
        showSnackBar("Error", "An error occurred while adding client", Colors.red);
      }
    } else {
      showSnackBar("Duplicate", "Client with this number already exists", Colors.red);
    }
  }

  // Tüm müşteri verilerini Firebase'den alır
  Future<void> getAllClients() async {
    loadData.value = true;
    clients.clear();

    try {
      var snapshot = await FirebaseFirestore.instance.collection('clients').orderBy('date', descending: true).get();
      for (var doc in snapshot.docs) {
        Client client = Client(
          address: doc['address'] ?? 'null',
          date: doc['date'] ?? '',
          name: doc['name'] ?? 'null',
          number: doc['number'] ?? 'null',
          orderCount: doc['order_count'] ?? 0,
          tmtPaid: doc['tmt_paid']?.toString() ?? '0.0',
          tmtUnpaid: doc['tmt_unpaid']?.toString() ?? '0.0',
          usdPaid: doc['usd_paid']?.toString() ?? '0.0',
          usdUnpaid: doc['usd_unpaid']?.toString() ?? '0.0',
          docID: doc.id,
        );

        clients.add(client);
      }
    } catch (e) {
      print(e);
      showSnackBar("Error", "Failed to load data", Colors.red);
    } finally {
      loadData.value = false;
    }
  }
}

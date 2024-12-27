import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_managament_admin/app/data/models/product_model.dart';
import 'package:stock_managament_admin/app/modules/units/controllers/units_controller.dart';
import 'package:stock_managament_admin/constants/customWidget/widgets.dart';

class HarytlarController extends GetxController {
  RxList<ProductModel> products = <ProductModel>[].obs;
  RxList<ProductModel> searchResult = <ProductModel>[].obs;
  RxBool loadData = false.obs;
  RxList<Map<String, dynamic>> units = <Map<String, dynamic>>[].obs;

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final UnitService unitService = UnitService();

  @override
  void onInit() {
    super.onInit();
    _loadUnits();
    getAllProducts();
  }

  Future<String> getNextProductCode() async {
    QuerySnapshot snapshot = await _db.collection('products').orderBy('productCode', descending: true).limit(1).get();

    if (snapshot.docs.isEmpty) {
      return "HRT1"; // Eğer hiç ürün yoksa, "HRT1" ile başlar
    } else {
      String lastCode = snapshot.docs.first['productCode']; // En son ürün kodunu al
      final RegExp regex = RegExp(r'(\d+)$'); // Sondaki sayıyı tespit etmek için düzenli ifade

      // Sondaki sayıyı bul ve bir artır
      if (regex.hasMatch(lastCode)) {
        int numericPart = int.parse(regex.firstMatch(lastCode)!.group(0)!);
        String prefix = lastCode.replaceAll(RegExp(r'\d+$'), ''); // Sayısal kısmı çıkar, sadece metin kısmını al
        return "$prefix${numericPart + 1}";
      } else {
        throw Exception("Invalid productCode format: $lastCode");
      }
    }
  }

  // Firebase'den birimleri al
  _loadUnits() async {
    List<Map<String, dynamic>> fetchedUnits = await unitService.getUnits();
    units.value = fetchedUnits;
  }

  // Ürünleri al
  Future<void> getAllProducts() async {
    loadData.value = true;
    products.clear();
    try {
      var snapshot = await _db.collection('products').orderBy('date', descending: true).get();
      for (var doc in snapshot.docs) {
        ProductModel product = ProductModel(
          productBolumi: doc['productBolumi'] ?? 'N/A',
          productName: doc['productName'] ?? 'N/A',
          productCode: doc['productCode'] ?? 'N/A',
          incomingGoods: doc['incomingGoods'].toString() ?? 'N/A',
          outgoingGoods: doc['outgoingGoods'].toString() ?? 'N/A',
          totalQuantity: doc['value'] ?? 'N/A',
          unitType: doc['unit'] ?? 'N/A',
          unit: doc['unitType'] ?? 'N/A',
          documentID: doc.id,
        );
        products.add(product);
      }
    } catch (e) {
      showSnackBar("Error", "Failed to load products", Colors.red);
    } finally {
      loadData.value = false;
    }
  }

  // Ürün ekleme
  Future<void> addProduct({
    required String productName,
    required String productBolumi,
    required String productCode,
    required String unit,
    required String unitType,
    required String value,
  }) async {
    await _db.collection('products').add({
      'date': DateTime.now().toString().substring(0, 19),
      'incomingGoods': '0',
      'outgoingGoods': '0',
      'productBolumi': productBolumi,
      'productCode': productCode,
      'productName': productName,
      'unit': unit,
      'unitType': unitType,
      'value': value.toString(),
    });
    getAllProducts();
  }

  // Ürün düzenleme
  Future<void> updateProduct({
    required String docID,
    required String newName,
    required String newCategory,
    String? newUnit,
  }) async {
    print(newName);
    print(newCategory);
    await _db.collection('products').doc(docID).update({
      'productName': newName,
      'productBolumi': newCategory,
      if (newUnit != null) 'unit': newUnit,
    }).then((_) {
      showSnackBar("Success", "Product updated successfully!", Colors.green);
    });
    getAllProducts();
  }

  // Ürün silme
  Future<void> deleteProduct(String docID) async {
    await _db.collection('products').doc(docID).delete().then((_) {
      showSnackBar("Success", "Product deleted successfully!", Colors.green);
    });
    getAllProducts();
  }

  // Ürün arama
  void onSearchTextChanged(String word) async {
    searchResult.clear();
    loadData.value = true;
    List<String> words = word.trim().split(' ');

    // Filtreleme işlemi
    var filteredData = products.where((product) {
      bool match = true;
      for (var searchWord in words) {
        if (RegExp(r'^[0-9]+$').hasMatch(searchWord)) {
          if (!product.productName.toString().toLowerCase().contains(searchWord.toLowerCase())) match = false;
        } else {
          if (!product.productCode.toString().toLowerCase().contains(searchWord.toLowerCase())) match = false;
        }
      }
      return match;
    }).toList();

    searchResult.value = filteredData;
    loadData.value = false;
  }
}

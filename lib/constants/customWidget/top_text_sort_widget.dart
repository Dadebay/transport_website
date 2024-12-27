import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_managament_admin/constants/customWidget/constants.dart';

class TopWidgetTextPart extends StatelessWidget {
  final bool addMorePadding;
  final List<Map<String, String>> names; // name ve sortName içeren liste
  final RxList<dynamic> dataList; // dinamik veri listesi

  const TopWidgetTextPart({
    super.key,
    required this.addMorePadding,
    required this.names, // Liste name ve sortName içeriyor
    required this.dataList, // Veri listesi
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        left: addMorePadding ? 60 : 10,
        right: 20.0,
        top: 10,
        bottom: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < names.length; i++) ...[
            _ButtonWidget(
              text: names[i]['name']!,
              sortName: names[i]['sortName']!,
              dataList: dataList, // Veri listesi gönderiyoruz
            ),
          ],
        ],
      ),
    );
  }
}

class _ButtonWidget extends StatelessWidget {
  final String text;
  final String sortName; // sortName parametresi
  final RxList<dynamic> dataList; // Dinamik veri listesi
  final RxBool sortValue = false.obs; // Sıralama yönü (artan/azalan)

  _ButtonWidget({
    super.key,
    required this.text,
    required this.sortName, // sortName parametresi
    required this.dataList, // Listeyi parametre olarak alıyoruz
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.grey.shade200,
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(4),
        child: GestureDetector(
          onTap: () {
            _sortList();
          },
          child: Text(
            text,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: AppFontSizes.fontSize4 + 1,
            ),
          ),
        ),
      ),
    );
  }

  void _sortList() {
    List<dynamic> productList = dataList;
    sortValue.value = !sortValue.value;
    productList.sort((a, b) {
      final dynamic first = a[sortName]; // Veriyi sortName ile sıralıyoruz
      final dynamic second = b[sortName]; // Veriyi sortName ile sıralıyoruz
      if (first is num && second is num) {
        return sortValue.value ? second.compareTo(first) : first.compareTo(second);
      } else if (first is String && second is String) {
        return sortValue.value ? second.compareTo(first) : first.compareTo(second);
      }
      return 0;
    });

    dataList.assignAll(productList);
  }
}

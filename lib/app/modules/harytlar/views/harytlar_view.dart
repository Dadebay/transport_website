import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_managament_admin/app/modules/harytlar/components/add_product_button.dart';
import 'package:stock_managament_admin/app/modules/harytlar/components/product_card.dart';
import 'package:stock_managament_admin/app/modules/harytlar/controllers/harytlar_controller.dart';
import 'package:stock_managament_admin/constants/customWidget/search_widget.dart';
import 'package:stock_managament_admin/constants/customWidget/top_text_sort_widget.dart';
import 'package:stock_managament_admin/constants/customWidget/widgets.dart';

class HarytlarView extends StatefulWidget {
  const HarytlarView({super.key});

  @override
  State<HarytlarView> createState() => _HarytlarViewState();
}

class _HarytlarViewState extends State<HarytlarView> {
  final TextEditingController _searchEditingController = TextEditingController();
  final HarytlarController _harytlarController = Get.put(HarytlarController());

  final List<Map<String, String>> clientNames = [
    {'name': 'Bolumi', 'sortName': "productName"},
    {'name': 'Product Name', 'sortName': "productName"},
    {'name': 'Units', 'sortName': "units"},
    {'name': 'Product Code', 'sortName': "productCode"},
    {'name': 'Incoming goods', 'sortName': "incomingGoods"},
    {'name': 'Outgoing goods', 'sortName': "outgoingGoods"},
    {'name': 'Sum count', 'sortName': "sumProducts"},
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SearchWidget(
              searchEditingController: _searchEditingController,
              onSearchTextChanged: (String value) {
                _harytlarController.onSearchTextChanged(value);
              },
              trailingButtonTapped: () {
                _searchEditingController.clear();
                _harytlarController.searchResult.clear();
              },
            ),
            TopWidgetTextPart(
              names: clientNames,
              addMorePadding: false,
              dataList: _harytlarController.products,
            ),
            const Divider(color: Colors.grey, thickness: 1),
            Expanded(
              child: Obx(() {
                if (_harytlarController.loadData.value) {
                  return spinKit();
                } else {
                  final dataList = _harytlarController.searchResult.isNotEmpty ? _harytlarController.searchResult : _harytlarController.products;

                  if (dataList.isEmpty && _searchEditingController.text.isNotEmpty) {
                    return emptyData();
                  }

                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: dataList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductCard(
                        productBolumi: dataList[index].productBolumi.toString(),
                        productCode: dataList[index].productCode.toString(),
                        productName: dataList[index].productName.toString(),
                        totalQuantity: int.parse(dataList[index].totalQuantity.toString()),
                        outgoingGoods: int.parse(dataList[index].outgoingGoods.toString()),
                        incomingGoods: int.parse(dataList[index].incomingGoods.toString()),
                        docID: dataList[index].documentID.toString(),
                        unit: dataList[index].unitType.toString(),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(color: Colors.grey, thickness: 1);
                    },
                  );
                }
              }),
            ),
          ],
        ),
        Positioned(
          right: 15.0,
          bottom: 15.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: 'button1',
                onPressed: () {},
                child: const Icon(CupertinoIcons.doc_person),
              ),
              const SizedBox(width: 30),
              AddProductButton(),
            ],
          ),
        ),
      ],
    );
  }
}

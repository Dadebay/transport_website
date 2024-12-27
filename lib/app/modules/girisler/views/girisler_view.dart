import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_managament_admin/constants/customWidget/search_widget.dart';

import '../controllers/girisler_controller.dart';

class GirislerView extends GetView<GirislerController> {
  final TextEditingController searchEditingController = TextEditingController();

  final List<Map<String, String>> clientNames = [
    {'name': 'Client Name', 'sortName': "name"},
    {'name': 'Address', 'sortName': "address"},
    {'name': 'Client number', 'sortName': "number"},
    {'name': 'Order count', 'sortName': "order_count"},
    {'name': 'TMT Paid', 'sortName': "tmt_paid"},
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SearchWidget(
              searchEditingController: searchEditingController,
              onSearchTextChanged: (String value) {
                // clientsController.onSearchTextChanged(value);
              },
              trailingButtonTapped: () {
                // searchEditingController.clear();
                // clientsController.clearFilter();
              },
            ),
            // TopWidgetTextPart(
            //   names: clientNames,
            //   addMorePadding: true,
            //   dataList: clientsController.clients,
            // ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            Expanded(
                child: Container(
              color: Colors.red,
            ))
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
                onPressed: () {
                  // clientsController.exportToExcel();
                },
                child: const Icon(CupertinoIcons.doc_person),
              ),
              const SizedBox(
                width: 30,
              ),
              // AddClientButton()
            ],
          ),
        ),
      ],
    );
  }
}

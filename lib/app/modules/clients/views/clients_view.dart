import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_managament_admin/app/data/models/client_model.dart';
import 'package:stock_managament_admin/app/modules/clients/components/add_client_button.dart';
import 'package:stock_managament_admin/app/modules/clients/components/client_card.dart';
import 'package:stock_managament_admin/constants/customWidget/search_widget.dart';
import 'package:stock_managament_admin/constants/customWidget/top_text_sort_widget.dart';
import 'package:stock_managament_admin/constants/customWidget/widgets.dart';

import '../controllers/clients_controller.dart';

class ClientsView extends StatelessWidget {
  final ClientsController clientsController = Get.put(ClientsController());
  final TextEditingController searchEditingController = TextEditingController();

  ClientsView({super.key});
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
                clientsController.onSearchTextChanged(value);
              },
              trailingButtonTapped: () {
                searchEditingController.clear();
                clientsController.clearFilter();
              },
            ),
            TopWidgetTextPart(
              names: clientNames,
              addMorePadding: true,
              dataList: clientsController.clients,
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            Expanded(
              child: Obx(() {
                if (clientsController.loadData.value) {
                  return spinKit();
                } else {
                  if (clientsController.searchResult.isEmpty && searchEditingController.text.isNotEmpty) {
                    return emptyData();
                  } else {
                    final dataList = clientsController.searchResult.isNotEmpty ? clientsController.searchResult : clientsController.clients;
                    return ListView.separated(
                      itemCount: dataList.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (dataList.length > index) {
                          Client client = dataList[index];
                          return ClientCard(
                            client: client,
                            count: dataList.length - index,
                            docID: client.docID,
                          );
                        }
                        return null;
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          color: Colors.grey.shade200,
                          thickness: 1,
                        );
                      },
                    );
                  }
                }
              }),
            )
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
                  clientsController.exportToExcel();
                },
                child: const Icon(CupertinoIcons.doc_person),
              ),
              const SizedBox(
                width: 30,
              ),
              AddClientButton()
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_managament_admin/constants/customWidget/search_widget.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchPageController> {
  TextEditingController searchEditingController = TextEditingController();

  SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchWidget(
          searchEditingController: searchEditingController,
          onSearchTextChanged: (String value) {
            // clientsController.onSearchTextChanged(value);
          },
          trailingButtonTapped: () {
            searchEditingController.clear();
            // clientsController.clearFilter();
          },
        ),
        // topWidgetTextPart(
        //   addMorePadding: true,
        //   names: clientNames,
        //   ordersView: false,
        //   clientView: true,
        //   purchasesView: false,
        // ),
        const Divider(
          color: Colors.grey,
          thickness: 1,
        ),
      ],
    );
  }
}

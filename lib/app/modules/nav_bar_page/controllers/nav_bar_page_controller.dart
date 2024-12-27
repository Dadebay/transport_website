import 'package:flutter/cupertino.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:stock_managament_admin/app/modules/clients/controllers/clients_controller.dart';
import 'package:stock_managament_admin/app/modules/clients/views/clients_view.dart';
import 'package:stock_managament_admin/app/modules/harytlar/views/harytlar_view.dart';
import 'package:stock_managament_admin/app/modules/home/views/home_view.dart';

class NavBarPageController extends GetxController {
  var selectedIndex = 0.obs;

  final ClientsController clientsController = Get.put(ClientsController());

  final List<Widget> pages = [
    const HomeView(),
    Container(),
    Container(),
    const HarytlarView(),
    Container(),
    ClientsView(),
  ];

  final List<IconData> icons = [
    IconlyLight.chart,
    CupertinoIcons.cart_badge_plus,
    IconlyLight.paper,
    IconlyLight.search,
    IconlyLight.category,
    IconlyLight.user3,
  ];

  final List<String> titles = [
    'Baş sahypa',
    'Girişler',
    'Çykyşlar',
    'Harytlar',
    'Çykdaýjylar',
    'Müşderiler',
  ];
  @override
  void onInit() {
    super.onInit();
    clientsController.getAllClients();
  }

  void onItemSelected(int index) {
    selectedIndex.value = index;
    if (index == 6) {
      // clientsController.getAllClients();
    }
  }
}

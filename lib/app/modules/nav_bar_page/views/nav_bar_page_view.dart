import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_managament_admin/app/modules/nav_bar_page/controllers/nav_bar_page_controller.dart';

import '../components/drawer_widget.dart';

class NavBarPageView extends StatefulWidget {
  const NavBarPageView({super.key});

  @override
  State<NavBarPageView> createState() => _NavBarPageViewState();
}

class _NavBarPageViewState extends State<NavBarPageView> {
  late final NavBarPageController navBarController;

  @override
  void initState() {
    super.initState();
    navBarController = Get.put(NavBarPageController());
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        children: [
          DrawerWidget(
            width: width,
            onItemSelected: navBarController.onItemSelected,
          ),
          Expanded(
            flex: 6,
            child:
                // Container(color: Colors.white, child: HarytlarView())

                Obx(() => Container(
                      color: Colors.white,
                      child: navBarController.pages[navBarController.selectedIndex.value],
                    )),
          ),
        ],
      ),
    );
  }
}

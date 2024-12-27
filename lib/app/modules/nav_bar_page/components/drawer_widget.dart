import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_managament_admin/app/modules/nav_bar_page/components/drawer_button.dart';
import 'package:stock_managament_admin/constants/customWidget/constants.dart';

import '../controllers/nav_bar_page_controller.dart';

class DrawerWidget extends StatelessWidget {
  final double width;
  final void Function(int) onItemSelected;

  const DrawerWidget({
    super.key,
    required this.width,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final NavBarPageController navBarController = Get.find();

    return Expanded(
      flex: 1,
      child: Column(
        children: [
          const DrawerHeaderWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              color: Colors.amber.withOpacity(0.2),
              thickness: 2,
            ),
          ),
          Expanded(
            flex: 13,
            child: ListView.builder(
              itemCount: navBarController.pages.length,
              itemBuilder: (context, index) {
                return Obx(() => DrawerButtonMine(
                      onTap: () {
                        onItemSelected(index);
                      },
                      index: index,
                      selectedIndex: navBarController.selectedIndex.value,
                      showIconOnly: width <= 1000.0,
                      icon: navBarController.icons[index],
                      title: navBarController.titles[index],
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      flex: 2,
      child: Center(
        child: Text(
          'Stock Management',
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.amber,
            fontFamily: Fonts.plusJakartaSansBold,
            fontWeight: FontWeight.w600,
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}

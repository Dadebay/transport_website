import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_managament_admin/constants/customWidget/constants.dart';

class DrawerButtonMine extends StatelessWidget {
  final VoidCallback onTap;
  final int index;
  final int selectedIndex;
  final bool showIconOnly;
  final IconData icon;
  final String title;

  const DrawerButtonMine({
    super.key,
    required this.onTap,
    required this.index,
    required this.selectedIndex,
    required this.showIconOnly,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      width: Get.size.width,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadii.borderRadius10,
          ),
          foregroundColor: Colors.white,
          backgroundColor: selectedIndex == index ? AppColors.brandYellow : AppColors.darkSecondaryColor,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        ),
        child: showIconOnly
            ? Padding(
                padding: const EdgeInsets.only(left: 8, right: 4),
                child: Icon(
                  icon,
                  color: selectedIndex == index ? Colors.black : Colors.white,
                ),
              )
            : Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 4),
                    child: Icon(
                      icon,
                      color: selectedIndex == index ? Colors.black : Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 4),
                      child: Text(
                        title.tr,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: selectedIndex == index ? Colors.black : Colors.white,
                          fontFamily: selectedIndex == index ? Fonts.plusJakartaSansBold : Fonts.plusJakartaSansRegular,
                          fontWeight: selectedIndex == index ? FontWeight.w600 : FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

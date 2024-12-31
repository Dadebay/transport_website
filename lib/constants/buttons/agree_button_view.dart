import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transport_website/app/modules/home/controllers/home_controller.dart';
import 'package:transport_website/constants/customWidget/constants.dart';

class AgreeButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final double? width;

  AgreeButton({super.key, required this.onTap, required this.text, this.width});
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: animatedContainer(context),
    );
  }

  Widget animatedContainer(BuildContext context) {
    final double defaultWidth = width ?? MediaQuery.of(context).size.width;

    return Obx(() {
      return AnimatedContainer(
        decoration: const BoxDecoration(
          borderRadius: BorderRadii.borderRadius15,
          color: AppColors.brandYellow,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: homeController.agreeButton.value ? 0 : 10),
        width: homeController.agreeButton.value ? 60 : defaultWidth,
        duration: const Duration(milliseconds: 800),
        child: homeController.agreeButton.value
            ? const Center(
                child: SizedBox(
                  width: 34,
                  height: 29,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              )
            : Text(
                text.tr,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.darkMainColor,
                  fontFamily: Fonts.plusJakartaSansBold,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
      );
    });
  }
}

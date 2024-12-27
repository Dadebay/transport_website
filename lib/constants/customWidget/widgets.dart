import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:stock_managament_admin/constants/customWidget/constants.dart';

SnackbarController showSnackBar(String title, String subtitle, Color color) {
  if (SnackbarController.isSnackbarBeingShown) {
    SnackbarController.cancelAllSnackbars();
  }
  return Get.snackbar(
    title,
    subtitle,
    snackStyle: SnackStyle.FLOATING,
    titleText: title == ''
        ? const SizedBox.shrink()
        : Text(
            title.tr,
            style: const TextStyle(fontFamily: Fonts.plusJakartaSansBold, fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
          ),
    messageText: Text(
      subtitle.tr,
      style: const TextStyle(fontFamily: Fonts.plusJakartaSansRegular, fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white),
    ),
    snackPosition: SnackPosition.TOP,
    backgroundColor: color,
    borderRadius: 20.0,
    duration: const Duration(milliseconds: 1000),
    margin: const EdgeInsets.all(8),
  );
}

Center spinKit() {
  return Center(
    child: Lottie.asset(Assets.loadingLottie, width: 70, height: 70),
  );
}

Center emptyData() {
  return Center(
      child: Text(
    "noProduct".tr,
    style: const TextStyle(color: Colors.black, fontFamily: Fonts.plusJakartaSansBold, fontWeight: FontWeight.w600, fontSize: 20),
  ));
}

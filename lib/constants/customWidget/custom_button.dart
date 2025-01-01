import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:transport_website/constants/customWidget/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;

  const CustomButton({super.key, required this.text, required this.color});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30), backgroundColor: color),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: AppFontSizes.getFontSize(1)),
              child: Text(
                text,
                style: TextStyle(color: AppColors.whiteMainColor, fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Icon(IconlyLight.arrowRightCircle, size: AppFontSizes.getFontSize(1.2), color: AppColors.whiteMainColor),
          ],
        ));
  }
}

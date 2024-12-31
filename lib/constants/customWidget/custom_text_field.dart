import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:transport_website/constants/customWidget/constants.dart';

class CustomTextField extends StatelessWidget {
  final String labelName;
  final int? maxline;
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode requestfocusNode;
  final bool unFocus;
  final BorderRadius borderRadius;
  final bool? readOnly;
  final bool? isNumber;
  final Function()? onTap;

  const CustomTextField({
    required this.labelName,
    required this.controller,
    required this.focusNode,
    required this.requestfocusNode,
    required this.unFocus,
    this.maxline,
    this.isNumber,
    this.borderRadius = BorderRadii.borderRadius5, // Varsayılan değer atandı
    this.readOnly,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        style: const TextStyle(color: AppColors.warmWhiteColor, fontFamily: Fonts.plusJakartaSansMedium, fontWeight: FontWeight.w400),
        cursorColor: AppColors.warmWhiteColor,
        onTap: onTap,
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return 'errorEmpty'.tr;
          }
          return null;
        },
        onEditingComplete: () {
          unFocus ? FocusScope.of(context).unfocus() : requestfocusNode.requestFocus();
        },
        maxLines: maxline ?? 1,
        focusNode: focusNode,
        keyboardType: isNumber == true ? TextInputType.number : TextInputType.text,
        enabled: readOnly,
        inputFormatters: isNumber == true
            ? [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(labelName == 'clientNumber' ? 8 : 300),
              ]
            : [
                LengthLimitingTextInputFormatter(labelName == 'clientNumber' ? 8 : 300),
              ],
        decoration: InputDecoration(
          errorMaxLines: 2,
          suffix: const SizedBox.shrink(),
          errorStyle: const TextStyle(fontFamily: Fonts.plusJakartaSansMedium, fontWeight: FontWeight.w400),
          hintMaxLines: 5,
          helperMaxLines: 5,
          hintStyle: TextStyle(color: Colors.grey.shade300, fontFamily: Fonts.plusJakartaSansMedium, fontWeight: FontWeight.w400),
          label: Text(
            labelName.tr,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey.shade400, fontFamily: Fonts.plusJakartaSansMedium, fontWeight: FontWeight.w400),
          ),
          contentPadding: const EdgeInsets.only(left: 25, top: 20, bottom: 20, right: 10),
          border: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: const BorderSide(color: Colors.grey, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: const BorderSide(color: AppColors.warmWhiteColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: const BorderSide(color: AppColors.brandYellow, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: const BorderSide(color: AppColors.brandYellow, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: const BorderSide(color: Colors.red, width: 2),
          ),
        ),
      ),
    );
  }
}

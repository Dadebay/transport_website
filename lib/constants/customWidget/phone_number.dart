// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:transport_website/constants/customWidget/constants.dart';

class PhoneNumber extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode mineFocus;
  final FocusNode requestFocus;
  final bool? disabled;
  final bool unFocus;
  final BorderRadius borderRadius;

  const PhoneNumber({
    super.key,
    required this.mineFocus,
    required this.controller,
    required this.requestFocus,
    required this.unFocus,
    this.disabled,
    this.borderRadius = BorderRadii.borderRadius20, // Varsayılan değer atandı
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: TextFormField(
        enabled: disabled ?? true,
        style: const TextStyle(color: AppColors.warmWhiteColor, fontSize: 18, fontFamily: Fonts.plusJakartaSansMedium, fontWeight: FontWeight.w400),
        cursorColor: AppColors.warmWhiteColor,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        focusNode: mineFocus,
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return 'errorEmpty'.tr;
          } else if (value.length != 8) {
            return 'errorPhoneCount'.tr;
          }
          return null;
        },
        inputFormatters: [
          LengthLimitingTextInputFormatter(8),
        ],
        onEditingComplete: () {
          unFocus ? FocusScope.of(context).unfocus() : requestFocus.requestFocus();
        },
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
          errorMaxLines: 2,
          errorStyle: const TextStyle(fontFamily: Fonts.plusJakartaSansMedium, fontWeight: FontWeight.w400),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              '+ 993',
              style: TextStyle(color: Colors.grey, fontSize: 18, fontFamily: Fonts.plusJakartaSansMedium, fontWeight: FontWeight.w400),
            ),
          ),
          contentPadding: const EdgeInsets.only(left: 25, top: 16, bottom: 18),
          prefixIconConstraints: const BoxConstraints(minWidth: 80),
          isDense: true,
          hintText: '65 656565 ',
          alignLabelWithHint: true,
          hintStyle: TextStyle(color: Colors.grey.shade400, fontFamily: Fonts.plusJakartaSansMedium, fontWeight: FontWeight.w400),
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

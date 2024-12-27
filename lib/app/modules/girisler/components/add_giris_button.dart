import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:stock_managament_admin/app/modules/clients/controllers/clients_controller.dart';
import 'package:stock_managament_admin/constants/buttons/agree_button_view.dart';
import 'package:stock_managament_admin/constants/customWidget/constants.dart';
import 'package:stock_managament_admin/constants/customWidget/custom_text_field.dart';
import 'package:stock_managament_admin/constants/customWidget/phone_number.dart';
import 'package:stock_managament_admin/constants/customWidget/widgets.dart';

class AddGirisButton extends StatelessWidget {
  final TextEditingController userNameEditingController = TextEditingController();
  final TextEditingController addressEditingController = TextEditingController();
  final TextEditingController phoneNumberEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final ClientsController clientsController = Get.find();

  AddGirisButton({super.key});

  void _addClient() {
    if (userNameEditingController.text.isEmpty || addressEditingController.text.isEmpty || phoneNumberEditingController.text.isEmpty) {
      showSnackBar('Error', 'Please fill all the fields', AppColors.errorRed);
    } else {
      clientsController.addClient(
        clientName: userNameEditingController.text,
        clientAddress: addressEditingController.text,
        clientPhoneNumber: phoneNumberEditingController.text,
      );
      Get.back(); // Dialog'u kapat
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "button",
      onPressed: () {
        Get.defaultDialog(
          title: "Add client",
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          content: SizedBox(
            width: Get.size.width / 3,
            height: Get.size.height / 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTextField(
                  labelName: 'Client name',
                  controller: userNameEditingController,
                  focusNode: focusNode,
                  requestfocusNode: focusNode1,
                  borderRadius: BorderRadii.borderRadius15,
                  unFocus: false,
                  readOnly: true,
                ),
                CustomTextField(
                  labelName: 'Address',
                  controller: addressEditingController,
                  focusNode: focusNode1,
                  borderRadius: BorderRadii.borderRadius15,
                  requestfocusNode: focusNode2,
                  unFocus: false,
                  readOnly: true,
                ),
                PhoneNumber(
                  mineFocus: focusNode2,
                  borderRadius: BorderRadii.borderRadius15,
                  controller: phoneNumberEditingController,
                  requestFocus: focusNode,
                  unFocus: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                AgreeButton(
                  onTap: _addClient,
                  text: "Add client",
                ),
              ],
            ),
          ),
        );
      },
      child: const Icon(IconlyLight.plus),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:stock_managament_admin/app/data/models/client_model.dart';
import 'package:stock_managament_admin/app/modules/clients/components/custom_2_text.dart';
import 'package:stock_managament_admin/app/modules/clients/controllers/clients_controller.dart';
import 'package:stock_managament_admin/constants/buttons/agree_button_view.dart';
import 'package:stock_managament_admin/constants/customWidget/custom_text_field.dart';
import 'package:stock_managament_admin/constants/customWidget/widgets.dart';

import '../../../../constants/customWidget/constants.dart';

class ClientCard extends StatelessWidget {
  final ClientsController clientsController = Get.find();

  ClientCard({super.key, required this.client, required this.count, required this.docID});
  final Client client;
  final int count;
  final String docID;

  // Show client details in a dialog
  void _showClientDetails(BuildContext context) {
    Get.defaultDialog(
      title: "Client Details",
      titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      titlePadding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Custom2Text(
            label: "Name:",
            value: client.name,
          ),
          Custom2Text(
            label: "Address:",
            value: client.address,
          ),
          Custom2Text(
            label: "Phone Number:",
            value: client.number,
          ),
          Custom2Text(
            label: "TMT Paid:",
            value: "${client.tmtPaid} TMT",
          ),
          Custom2Text(
            label: "TMT Unpaid:",
            value: "${client.tmtUnpaid} TMT",
          ),
          Custom2Text(
            label: "USD Paid:",
            value: "${client.usdPaid} USD",
          ),
          Custom2Text(
            label: "USD Unpaid:",
            value: "${client.usdUnpaid} USD",
          ),
          const SizedBox(
            height: 20,
          ),
          AgreeButton(
            onTap: () {
              Get.back();
            },
            text: 'Close',
            width: Get.size.width / 3,
          )
        ],
      ),
    );
  }

  void _editClient() {
    final TextEditingController userNameEditingController = TextEditingController(text: client.name);
    final TextEditingController addressEditingController = TextEditingController(text: client.address);
    final TextEditingController phoneNumberEditingController = TextEditingController(text: client.number);

    Get.defaultDialog(
      title: "Edit Client",
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      content: SizedBox(
        width: Get.size.width / 3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomTextField(labelName: 'Client name', controller: userNameEditingController, focusNode: FocusNode(), requestfocusNode: FocusNode(), unFocus: false, readOnly: true),
            CustomTextField(labelName: 'Address', controller: addressEditingController, focusNode: FocusNode(), requestfocusNode: FocusNode(), unFocus: false, readOnly: true),
            CustomTextField(labelName: 'Phone Number', controller: phoneNumberEditingController, focusNode: FocusNode(), requestfocusNode: FocusNode(), unFocus: false, readOnly: true),
            const SizedBox(
              height: 20,
            ),
            AgreeButton(
                onTap: () async {
                  final updatedClient = {
                    'name': userNameEditingController.text,
                    'address': addressEditingController.text,
                    'number': phoneNumberEditingController.text,
                  };
                  await FirebaseFirestore.instance.collection('clients').doc(docID).update(updatedClient).then((value) {
                    showSnackBar("Done", "${client.name} updated successfully", Colors.green);
                    clientsController.getAllClients();
                  });
                  Get.back();
                },
                text: "Update Client")
          ],
        ),
      ),
    );
  }

  Widget buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () => _editClient(),
              icon: const Icon(
                IconlyLight.edit,
                color: Colors.green,
              )),
          IconButton(
              onPressed: () async {
                await FirebaseFirestore.instance.collection('clients').doc(docID).delete().then((value) {
                  showSnackBar("Done", "${client.name} deleted successfully", Colors.green);
                });
                clientsController.clients.removeWhere((element) => element.number == client.number);
              },
              icon: const Icon(
                IconlyLight.delete,
                color: Colors.red,
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showClientDetails(context),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: Text(
              count.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontFamily: Fonts.plusJakartaSansBold, fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      client.name,
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.black, fontFamily: Fonts.plusJakartaSansBold, fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      client.address,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: const TextStyle(color: Colors.grey, fontFamily: Fonts.plusJakartaSansRegular, fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "+993${client.number}",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: const TextStyle(color: Colors.grey, fontFamily: Fonts.plusJakartaSansRegular, fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      client.orderCount.toString(),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.grey, fontFamily: Fonts.plusJakartaSansRegular, fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Custom2Text(
                          label: "TMT Paid:",
                          value: "${client.tmtPaid} TMT",
                        ),
                        Custom2Text(
                          label: "TMT Unpaid:",
                          value: "${client.tmtUnpaid} TMT",
                        ),
                        Custom2Text(
                          label: "USD Paid:",
                          value: "${client.usdPaid} USD",
                        ),
                        Custom2Text(
                          label: "USD Unpaid:",
                          value: "${client.usdUnpaid} USD",
                        ),
                      ],
                    ),
                  ),
                  buildActionButtons(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

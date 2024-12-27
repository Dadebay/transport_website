import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:stock_managament_admin/app/modules/harytlar/controllers/harytlar_controller.dart';
import 'package:stock_managament_admin/constants/buttons/agree_button_view.dart';
import 'package:stock_managament_admin/constants/customWidget/custom_text_field.dart';

class ProductCard extends StatelessWidget {
  final HarytlarController harytlarController = Get.find<HarytlarController>();

  final String productBolumi;
  final String productName;
  final String productCode;
  final String unit;
  final int incomingGoods;
  final int outgoingGoods;
  final int totalQuantity;
  final String docID;

  ProductCard({
    super.key,
    required this.productBolumi,
    required this.unit,
    required this.productName,
    required this.productCode,
    required this.incomingGoods,
    required this.outgoingGoods,
    required this.totalQuantity,
    required this.docID,
  });

  void _showProductDetails(BuildContext context) {
    Get.defaultDialog(
      title: "Product Details",
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Bolumi: $productBolumi"),
          Text("Name: $productName"),
          Text("Code: $productCode"),
          Text("Unit: $unit"),
          Text("Incoming: $incomingGoods"),
          Text("Outgoing: $outgoingGoods"),
          Text("Total: $totalQuantity"),
          const SizedBox(height: 20),
          AgreeButton(onTap: () => Get.back(), text: 'Close'),
        ],
      ),
    );
  }

  void _editProduct(BuildContext context) {
    TextEditingController productNameController = TextEditingController(text: productName);
    TextEditingController productBolumiController = TextEditingController(text: productName);

    Get.defaultDialog(
      title: "Edit Product",
      content: Column(
        children: [
          CustomTextField(
            labelName: 'Product Name',
            controller: productNameController,
            focusNode: FocusNode(),
            requestfocusNode: FocusNode(),
            unFocus: false,
          ),
          CustomTextField(
            labelName: 'Bolumi',
            focusNode: FocusNode(),
            requestfocusNode: FocusNode(),
            unFocus: false,
            controller: productBolumiController,
          ),
          DropdownButton<String>(
            value: unit,
            items: Get.find<HarytlarController>().units.map((unitItem) {
              return DropdownMenuItem<String>(
                value: unitItem['unit'],
                child: Text(unitItem['unit']),
              );
            }).toList(),
            onChanged: (value) {
              // controller ile unit güncelleme yapılacak
            },
          ),
          AgreeButton(
            onTap: () {
              print(docID);
              Get.find<HarytlarController>().updateProduct(
                docID: docID,
                newName: productNameController.text,
                newCategory: productBolumiController.text,
                newUnit: unit,
              );
              Get.back();
            },
            text: "Update Product",
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showProductDetails(context),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 5),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                productBolumi,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            Expanded(
              child: Text(
                productName,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            Expanded(
              child: Text(
                unit,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            Expanded(
              child: Text(
                productCode,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            Expanded(
              child: Text(
                incomingGoods.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            Expanded(
              child: Text(
                outgoingGoods.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            Expanded(
              child: Text(
                totalQuantity.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            IconButton(
              onPressed: () => _editProduct(context),
              icon: const Icon(IconlyLight.edit, color: Colors.green),
            ),
            IconButton(
              onPressed: () {
                Get.find<HarytlarController>().deleteProduct(docID);
              },
              icon: const Icon(IconlyLight.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}

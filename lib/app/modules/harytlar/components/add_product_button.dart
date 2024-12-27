import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:stock_managament_admin/app/modules/harytlar/controllers/harytlar_controller.dart';
import 'package:stock_managament_admin/constants/buttons/agree_button_view.dart';
import 'package:stock_managament_admin/constants/customWidget/constants.dart';
import 'package:stock_managament_admin/constants/customWidget/custom_text_field.dart';
import 'package:stock_managament_admin/constants/customWidget/widgets.dart';

class AddProductButton extends StatefulWidget {
  const AddProductButton({super.key});

  @override
  _AddProductButtonState createState() => _AddProductButtonState();
}

class _AddProductButtonState extends State<AddProductButton> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productBolumiController = TextEditingController();
  final TextEditingController valueController = TextEditingController();
  String? selectedUnit;
  String? selectedUnitType;
  final HarytlarController harytlarController = Get.find<HarytlarController>();

  // Ürün ekleme işlemi
  void _addProduct() async {
    if (productNameController.text.isEmpty || valueController.text.isEmpty || selectedUnit == null || selectedUnitType == null) {
      showSnackBar('Error', 'Please fill all the fields', AppColors.errorRed);
    } else {
      String nextProductCode = await harytlarController.getNextProductCode();
      harytlarController.addProduct(
        productName: productNameController.text,
        productBolumi: productBolumiController.text,
        productCode: nextProductCode.toString(),
        unit: selectedUnit!.toString(),
        unitType: selectedUnitType!.toString(),
        value: valueController.text,
      );
      Get.back();

      showSnackBar('Success', 'Product added successfully!', AppColors.green);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "addProductButton",
      onPressed: () {
        productBolumiController.clear();
        productNameController.clear();
        valueController.clear();
        Get.defaultDialog(
          title: "Add Product",
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          content: SizedBox(
            width: Get.size.width / 3,
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setStatsse) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomTextField(
                      labelName: 'Bolumi',
                      controller: productBolumiController,
                      focusNode: FocusNode(),
                      requestfocusNode: FocusNode(),
                      unFocus: false,
                    ),
                    CustomTextField(
                      labelName: 'Product Name',
                      controller: productNameController,
                      focusNode: FocusNode(),
                      requestfocusNode: FocusNode(),
                      unFocus: false,
                    ),
                    DropdownButton<String>(
                      hint: const Text("Select Unit"),
                      value: selectedUnit,
                      items: harytlarController.units.map((unit) {
                        return DropdownMenuItem<String>(
                          value: unit['unit'],
                          child: Text(unit['unit']),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setStatsse(() {
                          selectedUnit = value;
                          selectedUnitType = harytlarController.units.firstWhere((unit) => unit['unit'] == value)['valueType'];
                          print(selectedUnitType);
                        });
                        setState(() {});
                      },
                    ),
                    CustomTextField(
                      labelName: 'Value',
                      controller: valueController,
                      focusNode: FocusNode(),
                      requestfocusNode: FocusNode(),
                      unFocus: false,
                      isNumber: selectedUnitType.toString() == 'int' ? true : false,
                    ),
                    const SizedBox(height: 20),
                    AgreeButton(
                      onTap: _addProduct,
                      text: "Add Product",
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
      child: const Icon(IconlyLight.plus),
    );
  }
}

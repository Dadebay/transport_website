import 'package:flutter/material.dart';

import '../../../../constants/customWidget/constants.dart';

class DataItem {
  int x;
  double sales;
  double purchases;
  double sumCost;
  double expences;
  double profit;
  DataItem({required this.x, required this.sales, required this.sumCost, required this.purchases, required this.expences, required this.profit});
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

  DateTime? selectedDateTime = DateTime.now();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                names(name: "Sales", color: Colors.red, index: 0),
                names(name: "Purchase", color: Colors.amber, index: 1),
                names(name: "Expences", color: Colors.blue, index: 2),
                names(name: "Sum Cost", color: Colors.purple, index: 3),
                names(name: "Net Profit", color: Colors.green, index: 4),
                yearPicker(context),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: ElevatedButton(
                      onPressed: () async {},
                      style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          backgroundColor: Colors.black,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadii.borderRadius10),
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16)),
                      child: const Text(
                        "Export Excel",
                        style: TextStyle(color: Colors.white, fontFamily: Fonts.plusJakartaSansBold, fontWeight: FontWeight.w600, fontSize: 20),
                      )),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.red,
            child: const Text("BAR CHART BOLMALY SU TAYDA"),
          )),
        ],
      ),
    );
  }

  GestureDetector yearPicker(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Select Year"),
                content: SizedBox(
                  width: 300,
                  height: 300,
                  child: YearPicker(
                    firstDate: DateTime(DateTime.now().year - 10, 1),
                    lastDate: DateTime(DateTime.now().year + 100, 1),
                    selectedDate: selectedDateTime,
                    onChanged: (DateTime dateTime) {
                      setState(() {});
                      selectedDateTime = dateTime;
                      Navigator.pop(context);
                    },
                  ),
                ),
              );
            },
          );
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadii.borderRadius10),
          child: Row(
            children: [
              const Text(
                "Select Year : ",
                style: TextStyle(color: Colors.black, fontFamily: Fonts.plusJakartaSansBold, fontWeight: FontWeight.w600, fontSize: 20),
              ),
              Text(
                selectedDateTime!.year.toString(),
                style: const TextStyle(color: Colors.black, fontFamily: Fonts.plusJakartaSansBold, fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ],
          ),
        ));
  }

  Widget names({required String name, required Color color, required int index}) {
    return Expanded(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: Container(
              width: 30,
              height: 30,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: color,
                border: const Border(),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.black, decoration: TextDecoration.none, fontFamily: Fonts.plusJakartaSansBold, fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

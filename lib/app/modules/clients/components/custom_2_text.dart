import 'package:flutter/material.dart';
import 'package:stock_managament_admin/constants/customWidget/constants.dart';

class Custom2Text extends StatelessWidget {
  const Custom2Text({super.key, required this.label, required this.value});
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white70, fontFamily: Fonts.plusJakartaSansRegular, fontWeight: FontWeight.w400, fontSize: 14),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value,
              style: const TextStyle(color: Colors.white, fontFamily: Fonts.plusJakartaSansBold, fontWeight: FontWeight.w600, fontSize: 14),
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

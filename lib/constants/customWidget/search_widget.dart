import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController searchEditingController;
  final ValueChanged<String> onSearchTextChanged; // Updated this line
  final Function() trailingButtonTapped;

  const SearchWidget({
    super.key,
    required this.searchEditingController,
    required this.onSearchTextChanged,
    required this.trailingButtonTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          leading: const Icon(
            IconlyLight.search,
            color: Colors.white,
          ),
          title: TextField(
            controller: searchEditingController,
            decoration: InputDecoration(
              hintText: 'search'.tr,
              border: InputBorder.none,
            ),
            onChanged: onSearchTextChanged, // Updated this line
          ),
          contentPadding: const EdgeInsets.only(left: 15, right: 15),
          trailing: IconButton(
            icon: const Icon(CupertinoIcons.xmark_circle),
            onPressed: trailingButtonTapped,
          ),
        ),
      ),
    );
  }
}

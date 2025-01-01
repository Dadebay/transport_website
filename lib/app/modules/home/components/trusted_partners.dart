import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:transport_website/constants/customWidget/constants.dart';

class TrustedPartnersView extends StatefulWidget {
  const TrustedPartnersView({super.key});

  @override
  State<TrustedPartnersView> createState() => _TrustedPartnersViewState();
}

class _TrustedPartnersViewState extends State<TrustedPartnersView> {
  final ScrollController _scrollController = ScrollController();

  late Timer _scrollTimer;

  final int itemCount = 37;
  // Toplam eleman sayısı
  late List<int> extendedItemList;

  @override
  void initState() {
    super.initState();
    final random = Random();
    final startIndex = random.nextInt(itemCount);
    extendedItemList = List.generate(itemCount * 3, (index) => (index + startIndex) % itemCount + 1);
    startAutoScroll();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollTimer.cancel();
    super.dispose();
  }

  void startAutoScroll() {
    const scrollSpeed = 6.0; // Kaydırma hızı
    _scrollTimer = Timer.periodic(const Duration(milliseconds: 80), (_) {
      if (_scrollController.hasClients) {
        if (_scrollController.offset >= _scrollController.position.maxScrollExtent) {
          _scrollController.jumpTo(0);
        } else {
          _scrollController.animateTo(
            _scrollController.offset + scrollSpeed,
            duration: const Duration(milliseconds: 80),
            curve: Curves.linear,
          );
        }
      }
    });
  }

  Widget buildGridView() {
    return MasonryGridView.builder(
      controller: _scrollController,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 8,
      ),
      itemCount: extendedItemList.length,
      mainAxisSpacing: 20.0,
      crossAxisSpacing: 20.0,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            print(extendedItemList[index]);
          },
          child: Container(
            margin: const EdgeInsets.all(6),
            height: index % 2 == 0 ? 250 : 300, // Değişken yükseklik
            width: 80,
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: AppColors.whiteMainColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.whiteBlue,
                  spreadRadius: 2,
                  blurRadius: 12,
                ),
              ],
              borderRadius: BorderRadii.borderRadius50,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                'assets/logos/${extendedItemList[index]}.webp',
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildForegroundContent() {
    return Center(
      child: Container(
        height: Get.size.height / 2,
        width: Get.size.width / 2,
        padding: EdgeInsets.all(AppFontSizes.getFontSize(4)),
        decoration: BoxDecoration(color: AppColors.darkMainColor.withOpacity(0.9)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Our Trusted Partners',
                  style: TextStyle(color: AppColors.whiteMainColor, fontWeight: FontWeight.bold, fontSize: AppFontSizes.getFontSize(3)),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Grow your business with our trusted partners. We have a wide range of partnerships that can help you reach a wider audience and grow your business.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.whiteMainColor, fontWeight: FontWeight.w400, fontSize: AppFontSizes.getFontSize(1.5)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blue,
      width: Get.size.width,
      height: Get.size.height,
      child: Stack(
        children: [
          Positioned.fill(child: buildGridView()),
          _buildForegroundContent(),
        ],
      ),
    );
  }
}

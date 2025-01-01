import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:transport_website/constants/customWidget/constants.dart';
import 'package:transport_website/constants/customWidget/custom_button.dart';

class InsightView extends StatefulWidget {
  const InsightView({super.key});

  @override
  State<InsightView> createState() => _InsightViewState();
}

class _InsightViewState extends State<InsightView> {
  final ScrollController _scrollController = ScrollController();
  List<Insight> insights = [
    Insight(
      title: 'The Impact of E-Commerce on Logistics',
      description: '2400+ Companies Trusting',
      imagePath: 'assets/image/10.jpeg',
    ),
    Insight(
      title: 'Revolutionizing the Logistics Industry',
      description: '2400+ Companies Trusting',
      imagePath: 'assets/image/11.jpeg',
    ),
    Insight(
      title: 'Satisfaction with Efficient Logistics',
      description: '2400+ Companies Trusting',
      imagePath: 'assets/image/12.jpeg',
    ),
    Insight(
      title: 'The Impact of E-Commerce on Logistics',
      description: '2400+ Companies Trusting',
      imagePath: 'assets/image/10.jpeg',
    ),
    Insight(
      title: 'Revolutionizing the Logistics Industry',
      description: '2400+ Companies Trusting',
      imagePath: 'assets/image/11.jpeg',
    ),
    Insight(
      title: 'Satisfaction with Efficient Logistics',
      description: '2400+ Companies Trusting',
      imagePath: 'assets/image/12.jpeg',
    ),
    Insight(
      title: 'The Impact of E-Commerce on Logistics',
      description: '2400+ Companies Trusting',
      imagePath: 'assets/image/10.jpeg',
    ),
    Insight(
      title: 'Revolutionizing the Logistics Industry',
      description: '2400+ Companies Trusting',
      imagePath: 'assets/image/11.jpeg',
    ),
  ];
  int _currentPage = 0;
  double _scrollOffset = 0;
  double _cardWidth = 0.0;
  Timer? _timer;

  void _scroll(bool isLeft) {
    double scrollDistance = Get.width * .4;
    if (isLeft) {
      _scrollOffset -= scrollDistance;
      _scrollController.animateTo(
        _scrollOffset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      _scrollOffset += scrollDistance;
      _scrollController.animateTo(
        _scrollOffset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }

    setState(() {
      _currentPage = (_scrollOffset / (_cardWidth)).round() % insights.length;
    });
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_scrollController.hasClients) {
        _scroll(false); // Otomatik sağa kaydırma
      }
    });
  }

  void _stopAutoScroll() {
    _timer?.cancel();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cardWidth = Get.width * 0.8; // cardin genisligi ve marginini topladim
  }

  @override
  void initState() {
    _startAutoScroll();
    _scrollController.addListener(_updatePage);
    super.initState();
  }

  @override
  void didUpdateWidget(InsightView oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void _updatePage() {
    _scrollOffset = _scrollController.position.pixels;
    setState(() {
      _currentPage = (_scrollOffset / (_cardWidth)).round() % insights.length;
    });
  }

  @override
  void dispose() {
    _stopAutoScroll();
    _scrollController.removeListener(_updatePage);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.size.height,
      width: Get.size.width,
      color: AppColors.blue,
      margin: EdgeInsets.symmetric(vertical: AppFontSizes.getFontSize(5)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("DISCOVER THE LATEST INSIGHT", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: AppFontSizes.getFontSize(2.5))),
              Row(
                children: [
                  IconButton(
                      onPressed: () => _scroll(false),
                      style: IconButton.styleFrom(backgroundColor: AppColors.darkBlue, padding: EdgeInsets.all(20), shape: const CircleBorder()),
                      icon: Icon(IconlyLight.arrowLeftCircle, color: Colors.white, size: AppFontSizes.getFontSize(2))),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                      onPressed: () => _scroll(true),
                      style: IconButton.styleFrom(backgroundColor: AppColors.darkBlue, focusColor: AppColors.darkBlue, padding: EdgeInsets.all(20), shape: const CircleBorder()),
                      icon: Icon(IconlyLight.arrowRightCircle, color: Colors.white, size: AppFontSizes.getFontSize(2))),
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 70),
            height: Get.size.height * 0.8,
            child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final int adjustedIndex = index % insights.length;
                  return InsightCard(
                    insight: insights[adjustedIndex],
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class Insight {
  final String title;
  final String description;
  final String imagePath;
  Insight({required this.title, required this.description, required this.imagePath});
}

class InsightCard extends StatefulWidget {
  final Insight insight;
  const InsightCard({super.key, required this.insight});

  @override
  _InsightCardState createState() => _InsightCardState();
}

class _InsightCardState extends State<InsightCard> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        width: Get.size.width * 0.3,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            Positioned.fill(
                child: ClipRRect(
              borderRadius: BorderRadii.borderRadius40,
              child: Image.asset(
                widget.insight.imagePath,
                fit: BoxFit.cover,
              ),
            )),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              bottom: _isHovered ? 0 : -Get.height / 1.2,
              left: 0,
              right: 0,
              child: Container(
                height: Get.height / 1.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadii.borderRadius40,
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [AppColors.blue, Colors.transparent],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.insight.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: AppColors.whiteMainColor, fontSize: AppFontSizes.getFontSize(2), fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.insight.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: AppColors.whiteMainColor, fontSize: AppFontSizes.getFontSize(1.2), fontWeight: FontWeight.w400),
                  ),
                  AnimatedContainer(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      duration: const Duration(milliseconds: 200),
                      height: _isHovered ? 80 : 0,
                      child: _isHovered ? CustomButton(text: 'Read More', color: AppColors.brandYellow) : const SizedBox.shrink()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

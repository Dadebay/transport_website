import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transport_website/app/modules/home/components/custom_nav_bar.dart';
import 'package:transport_website/app/modules/home/components/video_player_view.dart';
import 'package:transport_website/constants/customWidget/constants.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController _scrollController = ScrollController();
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      drawer: const Drawer(
        child: Column(
          children: [],
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            Positioned.fill(
              child: ListView(
                controller: _scrollController,
                children: [
                  const VideoPlayerView(),
                  Container(
                    alignment: Alignment.bottomLeft,
                    height: Get.size.height,
                    width: Get.size.width,
                    color: AppColors.brandYellow,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 120,
              child: CustomNavbar(
                isAppBarPinned: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

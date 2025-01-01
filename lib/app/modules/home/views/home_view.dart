import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transport_website/app/modules/home/components/insight_view.dart';
import 'package:transport_website/app/modules/home/components/parallax_image_view.dart';
import 'package:transport_website/app/modules/home/components/services_view.dart';
import 'package:transport_website/app/modules/home/components/trusted_partners.dart';
import 'package:transport_website/app/modules/home/components/video_player_view.dart';
import 'package:transport_website/constants/customWidget/constants.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      drawer: const Drawer(
        child: Column(
          children: [],
        ),
      ),
      body: ListView(
        children: [
          const VideoPlayerView(),
          ServicesView(),
          ParallaxView(),
          InsightView(),
          TrustedPartnersView(),
          Container(
            height: Get.size.height,
            width: Get.size.width,
            color: AppColors.darkMainColor,
          )
        ],
      ),
    );
  }
}

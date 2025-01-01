import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:transport_website/constants/customWidget/constants.dart';

class Service {
  final String title;
  final String description;
  final String imagePath;

  Service({required this.title, required this.description, required this.imagePath});
}

class ServicesView extends StatelessWidget {
  List<Service> services = [
    Service(title: 'FREIGHT FORWARDING', description: 'Excepteur sint occaecat cupidatat officia non proident sunt in culpa qui deserunt.!', imagePath: 'assets/icons/service-4.webp'),
    Service(title: 'LAST-MILE DELIVERY', description: 'Excepteur sint occaecat cupidatat officia non proident sunt in culpa qui deserunt.!', imagePath: 'assets/icons/service-5.webp'),
    Service(title: 'AIR CARGO SERVICE', description: 'Excepteur sint occaecat cupidatat officia non proident sunt in culpa qui deserunt.!', imagePath: 'assets/icons/service-6.webp'),
    Service(title: 'OCEAN FREIGHT SERVICES', description: 'Excepteur sint occaecat cupidatat officia non proident sunt in culpa qui deserunt.!', imagePath: 'assets/icons/service-7.webp'),
    Service(title: 'RAIL FREIGHT SERVICES', description: 'Excepteur sint occaecat cupidatat officia non proident sunt in culpa qui deserunt.!', imagePath: 'assets/icons/service-8.webp'),
    Service(title: 'DISTRIBUTION SERVICES', description: 'Excepteur sint occaecat cupidatat officia non proident sunt in culpa qui deserunt.!', imagePath: 'assets/icons/service-9.webp'),
    Service(title: 'CUSTOMS BROKERAGE', description: 'Excepteur sint occaecat cupidatat officia non proident sunt in culpa qui deserunt.!', imagePath: 'assets/icons/service-10.webp'),
    Service(title: 'SUPPLY CHAIN', description: 'Excepteur sint occaecat cupidatat officia non proident sunt in culpa qui deserunt.!', imagePath: 'assets/icons/service-11.webp'),
  ];

  ServicesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.size.width,
      padding: EdgeInsets.symmetric(horizontal: Get.size.width * 0.08, vertical: Get.size.width * 0.05),
      color: AppColors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'explore our services'.toUpperCase(),
            style: TextStyle(color: AppColors.whiteMainColor, fontWeight: FontWeight.bold, fontSize: AppFontSizes.getFontSize(3)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 100, top: 100),
            child: Center(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 80,
                  childAspectRatio: 0.9,
                ),
                itemCount: services.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ServiceCard(service: services[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatefulWidget {
  final Service service;

  const ServiceCard({super.key, required this.service});

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInUp(
            duration: const Duration(milliseconds: 500),
            child: Image.asset(
              widget.service.imagePath,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(color: isHovered ? AppColors.whiteBlue : AppColors.defaultCardColor, borderRadius: BorderRadii.borderRadius20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FadeInUp(
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      widget.service.title,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: AppFontSizes.getFontSize(1.4), color: isHovered ? Colors.white : Colors.grey),
                    ),
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 700),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        widget.service.description,
                        textAlign: TextAlign.start,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: AppFontSizes.getFontSize(.9), color: isHovered ? Colors.white : Colors.grey),
                      ),
                    ),
                  ),
                  FadeInUp(
                      duration: const Duration(milliseconds: 900),
                      child: Container(
                          width: Get.size.width / 10,
                          height: 80,
                          decoration: BoxDecoration(color: Colors.grey.withOpacity(.4), borderRadius: BorderRadii.borderRadius50),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: AnimatedContainer(
                                  width: isHovered ? Get.size.width : 80,
                                  duration: Duration(seconds: 1),
                                  curve: Curves.easeInOut,
                                  decoration: BoxDecoration(
                                    color: AppColors.darkMainColor,
                                    borderRadius: BorderRadii.borderRadius50,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 30,
                                bottom: 0,
                                top: 0,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: AppFontSizes.getFontSize(1)),
                                      child: Text(
                                        "Read More".toUpperCase(),
                                        style: TextStyle(color: AppColors.whiteMainColor, fontSize: 18, fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Icon(IconlyLight.arrowRightCircle, size: AppFontSizes.getFontSize(1.2), color: AppColors.whiteMainColor),
                                  ],
                                ),
                              ),
                            ],
                          ))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

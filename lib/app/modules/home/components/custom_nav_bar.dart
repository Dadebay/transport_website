import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:transport_website/app/modules/home/controllers/home_controller.dart';
import 'package:transport_website/constants/customWidget/constants.dart';

class CustomNavbar extends StatelessWidget {
  CustomNavbar({super.key, required this.isAppBarPinned});

  final HomeController navbarController = Get.put<HomeController>(HomeController());
  final bool isAppBarPinned;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return tablerDesktop();
        } else {
          return mobileNavbar(context);
        }
      },
    );
  }

  Widget tablerDesktop() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: FadeInLeft(
                duration: Duration(milliseconds: 500),
                child: SvgPicture.asset(
                  Assets.logo,
                  height: 50,
                ),
              )),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildMenuItem(1, 'Home', () => _handleMenuItemClick('Home')),
                  _buildMenuItem(2, 'About', () => _handleMenuItemClick('About')),
                  _buildMenuItem(3, 'Services', () => _handleMenuItemClick('Services')),
                  _buildMenuItem(4, 'Pages', () => _handleMenuItemClick('Pages')),
                  _buildMenuItem(5, 'Blog', () => _handleMenuItemClick('Blog')),
                  _buildMenuItem(6, 'Contact', () => _handleMenuItemClick('Contact')),
                ],
              )),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildLanguageDropdown(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: IconButton(
                      icon: Icon(IconlyLight.search, size: AppFontSizes.fontSize6 - 2, color: isAppBarPinned ? Colors.black : AppColors.whiteMainColor),
                      onPressed: () {
                        _handleSearchAction();
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(IconlyLight.profile, size: AppFontSizes.fontSize6 - 2, color: isAppBarPinned ? Colors.black : AppColors.whiteMainColor),
                    onPressed: () {
                      _handleProfileAction();
                    },
                  ),
                ],
              ))
            ],
          ),
        ),
        Divider(
          color: AppColors.whiteMainColor.withOpacity(.6),
        )
      ],
    );
  }

  Widget _buildMenuItem(int index, String text, VoidCallback onTap) {
    return FadeInDown(
      duration: Duration(milliseconds: 400 * index),
      child: InkWell(
        onTap: onTap,
        child: Text(
          text,
          style: TextStyle(color: isAppBarPinned ? AppColors.darkMainColor : AppColors.whiteMainColor, fontSize: AppFontSizes.fontSize4 + 4, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildLanguageDropdown() {
    return Obx(() => GestureDetector(
          onTap: () {
            navbarController.toggleMenu();
          },
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    Text(
                      navbarController.selectedLanguage.value,
                      style: TextStyle(color: isAppBarPinned ? Colors.black : AppColors.whiteMainColor, fontSize: AppFontSizes.fontSize4, fontWeight: FontWeight.w500),
                    ),
                    Icon(Icons.arrow_drop_down, color: isAppBarPinned ? Colors.black : AppColors.whiteMainColor),
                  ],
                ),
              ),
              Positioned(
                top: 40,
                right: 0,
                child: Visibility(
                  visible: navbarController.isMenuOpen.value,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadii.borderRadius10,
                    ),
                    width: 80,
                    child: ListView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0),
                      children: <String>['EN', 'TR'].map((String value) {
                        return Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              navbarController.toggleMenu();
                              navbarController.changeLanguage(value);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              child: Text(
                                value,
                                style: TextStyle(color: AppColors.whiteMainColor, fontSize: AppFontSizes.fontSize3, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget mobileNavbar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: isAppBarPinned ? AppColors.whiteMainColor : Colors.red,
            )),
        Expanded(
            child: Center(
                child: SvgPicture.asset(
          'assets/icons/logo-2.svg',
          height: 40,
        ))),
      ],
    );
  }

  void _handleMenuItemClick(String menuItem) {
    debugPrint('$menuItem menüsüne tıklandı.');
  }

  void _handleSearchAction() {
    debugPrint('Arama ikonuna tıklandı.');
  }

  void _handleProfileAction() {
    debugPrint('Profil ikonuna tıklandı.');
  }
}

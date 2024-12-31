import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool agreeButton = false.obs;
  var isMenuOpen = false.obs;
  var selectedLanguage = 'EN'.obs;
  var isAppBarPinned = false.obs;

  void toggleMenu() {
    isMenuOpen.value = !isMenuOpen.value;
  }

  void changeLanguage(String language) {
    selectedLanguage.value = language;
  }

  void toggleAgreeButton() {
    agreeButton.value = !agreeButton.value;
  }

  void toggleAppBarPin() {
    isAppBarPinned.value = !isAppBarPinned.value;
  }
}

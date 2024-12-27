import 'package:get/get.dart';

import '../controllers/girisler_controller.dart';

class GirislerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GirislerController>(
      () => GirislerController(),
    );
  }
}

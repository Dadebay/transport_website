import 'package:get/get.dart';

import '../controllers/harytlar_controller.dart';

class HarytlarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HarytlarController>(
      () => HarytlarController(),
    );
  }
}

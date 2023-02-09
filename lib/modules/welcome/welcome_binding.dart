import 'package:get/get.dart';
import 'package:healcare_mobile/modules/welcome/welcome_controller.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(WelcomeController());
    Get.lazyPut(() => WelcomeController());
  }
}
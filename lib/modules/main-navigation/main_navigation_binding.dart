import 'package:get/get.dart';
import 'package:healcare_mobile/modules/main-navigation/main_navigation_controller.dart';

class MainNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainNavigationController());
  }
}

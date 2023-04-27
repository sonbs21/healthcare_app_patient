import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/welcome/welcome_controller.dart';
import 'package:healthcare_mobile/service/auth_service.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(WelcomeController());
    Get.lazyPut(() => WelcomeController());
    Get.lazyPut(() => AuthService(), fenix: true);
  }
}
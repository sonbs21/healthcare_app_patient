import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/change-password/change_password_controller.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordController());
  }
}

import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/phone_pass/phone_pass_controller.dart';

class PhonePassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PhonePassController());
  }
}

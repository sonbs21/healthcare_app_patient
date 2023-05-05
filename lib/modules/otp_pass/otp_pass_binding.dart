import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/otp_pass/otp_pass_controller.dart';

class OtpPassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpPassController());
  }
}

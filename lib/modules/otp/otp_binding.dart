import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/otp/otp_controller.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpController());
  }
}

import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/call/call_controller.dart';

class CallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CallController());
  }
}

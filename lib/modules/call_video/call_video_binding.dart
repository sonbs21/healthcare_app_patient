import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/call/call_controller.dart';
import 'package:healthcare_mobile/modules/call_video/call_video_controller.dart';

class CallVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CallVideoController());
  }
}

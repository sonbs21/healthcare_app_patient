import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/heartbeat/heartbeat_controller.dart';

class HeartbeatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HeartbeatController());
  }
}

import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/appointment/appointment.controller.dart';
import 'package:healthcare_mobile/modules/chat/chat_controller.dart';

class AppointetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppointmentController());
  }
}

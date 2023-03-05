import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/doctor/appointment_controller.dart';

class AppointmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppointmentController());
  }
}

import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/doctor/doctor_controller.dart';

class DoctorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DoctorController());
  }
}

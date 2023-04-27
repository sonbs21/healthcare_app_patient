import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/select-doctor/select_doctor_controller.dart';

class SelectDoctorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectDoctorController());
  }
}

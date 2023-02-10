import 'package:get/get.dart';
import 'package:healcare_mobile/modules/doctor/doctor_controller.dart';

class DoctorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DoctorController());
  }
}

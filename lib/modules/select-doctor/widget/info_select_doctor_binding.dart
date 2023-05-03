import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/select-doctor/widget/info_select_doctor_controller.dart';

class InfoSelectDoctorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InfoSelectDoctorController());
  }
}

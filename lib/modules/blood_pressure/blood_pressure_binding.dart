import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/blood_pressure/blood_pressure_controller.dart';

class BloodPressureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BloodPressureController());
  }
}

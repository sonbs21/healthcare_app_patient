import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/blood_pressure/blood_pressure_controller.dart';
import 'package:healthcare_mobile/modules/bmi/bmi_controller.dart';

class BmiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BmiController());
  }
}

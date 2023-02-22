import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/cholesterol/cholesterol_controller.dart';

class CholesterolBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CholesterolController());
  }
}

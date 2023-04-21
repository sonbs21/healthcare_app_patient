import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/personal-info/personal_info_controller.dart';

class PersonalInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PersonalInfoController());
  }
}

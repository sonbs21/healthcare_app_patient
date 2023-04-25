import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/personal-update/personal_update_controller.dart';

class PersonalUpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PersonalUpdateController());
  }
}

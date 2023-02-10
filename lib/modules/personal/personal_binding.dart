import 'package:get/get.dart';
import 'package:healcare_mobile/modules/personal/personal_controller.dart';

class PersonalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PersonalController());
  }
}

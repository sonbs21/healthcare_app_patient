import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/chat/gpt/screens/gpt_controller.dart';

class GptBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GptController());
  }
}

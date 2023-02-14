import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/chat_gpt/chat_gpt_controller.dart';

class ChatGptBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatGptController());
  }
}

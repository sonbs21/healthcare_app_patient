import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/chat/chat_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController());
  }
}

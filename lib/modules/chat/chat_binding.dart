import 'package:get/get.dart';
import 'package:healcare_mobile/modules/chat/chat_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController());
  }
}

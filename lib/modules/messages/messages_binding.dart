import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/messages/messages_controller.dart';

class MessagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessagesController());
  }
}

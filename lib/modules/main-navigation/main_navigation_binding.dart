import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/chat/chat_controller.dart';
import 'package:healthcare_mobile/modules/doctor/doctor_controller.dart';
import 'package:healthcare_mobile/modules/home/home_controller.dart';
import 'package:healthcare_mobile/modules/main-navigation/main_navigation_controller.dart';
import 'package:healthcare_mobile/modules/messages/messages_controller.dart';
import 'package:healthcare_mobile/modules/notification/notification_controller.dart';
import 'package:healthcare_mobile/modules/personal/personal_controller.dart';
import 'package:healthcare_mobile/service/socket_service.dart';

class MainNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainNavigationController());
    // Get.lazyPut(() => SocketService());
    // Get.put(SocketService());
    Get.lazyPut(() => SocketService());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ChatController>(() => ChatController());
    Get.lazyPut<MessagesController>(() => MessagesController());
    Get.lazyPut<DoctorController>(() => DoctorController());
    Get.lazyPut<NotificationController>(() => NotificationController());
    Get.lazyPut<PersonalController>(() => PersonalController());
  }
}

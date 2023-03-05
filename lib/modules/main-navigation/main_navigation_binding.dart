import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/chat/chat_controller.dart';
import 'package:healthcare_mobile/modules/doctor/appointment_controller.dart';
import 'package:healthcare_mobile/modules/doctor/doctor_controller.dart';
import 'package:healthcare_mobile/modules/home/home_controller.dart';
import 'package:healthcare_mobile/modules/main-navigation/main_navigation_controller.dart';
import 'package:healthcare_mobile/modules/personal/personal_controller.dart';

class MainNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainNavigationController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ChatController>(() => ChatController());
    Get.lazyPut<DoctorController>(() => DoctorController());
    Get.lazyPut<AppointmentController>(() => AppointmentController());
    Get.lazyPut<PersonalController>(() => PersonalController());
  }
}

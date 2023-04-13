import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/appointment/appointment_form.dart';
import 'package:healthcare_mobile/modules/blood_pressure/blood_pressure_binding.dart';
import 'package:healthcare_mobile/modules/blood_pressure/blood_pressure_page.dart';
import 'package:healthcare_mobile/modules/bmi/bmi_binding.dart';
import 'package:healthcare_mobile/modules/bmi/bmi_page.dart';
import 'package:healthcare_mobile/modules/chat/chat_binding.dart';
import 'package:healthcare_mobile/modules/chat/chat_page.dart';
import 'package:healthcare_mobile/modules/chat/gpt/screens/gpt_binding.dart';
import 'package:healthcare_mobile/modules/chat/gpt/screens/gpt_screen.dart';
// import 'package:healthcare_mobile/modules/chat_gpt/chat_gpt_binding.dart';
// import 'package:healthcare_mobile/modules/chat_gpt/chat_gpt_screen.dart';
import 'package:healthcare_mobile/modules/cholesterol/cholesterol_binding.dart';
import 'package:healthcare_mobile/modules/cholesterol/cholesterol_page.dart';
import 'package:healthcare_mobile/modules/doctor/doctor_binding.dart';
import 'package:healthcare_mobile/modules/glucose/glucose_binding.dart';
import 'package:healthcare_mobile/modules/glucose/glucose_page.dart';
import 'package:healthcare_mobile/modules/health-record/health-record_binding.dart';
import 'package:healthcare_mobile/modules/health-record/health_record_page.dart';
import 'package:healthcare_mobile/modules/heartbeat/heartbeat_binding.dart';
import 'package:healthcare_mobile/modules/heartbeat/heartbeat_page.dart';
import 'package:healthcare_mobile/modules/home/home_binding.dart';
import 'package:healthcare_mobile/modules/home/home_pages.dart';
import 'package:healthcare_mobile/modules/login/login_binding.dart';
import 'package:healthcare_mobile/modules/login/login_page.dart';
import 'package:healthcare_mobile/modules/main-navigation/main_navigation.dart';
import 'package:healthcare_mobile/modules/main-navigation/main_navigation_binding.dart';
import 'package:healthcare_mobile/modules/messages/messages_binding.dart';
import 'package:healthcare_mobile/modules/messages/messages_page.dart';
import 'package:healthcare_mobile/modules/notification/notification_pages.dart';
import 'package:healthcare_mobile/modules/notification/notification_binding.dart';
import 'package:healthcare_mobile/modules/personal/personal_binding.dart';
import 'package:healthcare_mobile/modules/personal/personal_pages.dart';
import 'package:healthcare_mobile/modules/sign_up/sign_up_binding.dart';
import 'package:healthcare_mobile/modules/sign_up/sign_up_page.dart';
import 'package:healthcare_mobile/modules/splash/splash_binding.dart';
import 'package:healthcare_mobile/modules/splash/splash_page.dart';
import 'package:healthcare_mobile/modules/welcome/view/welcome_page.dart';
import 'package:healthcare_mobile/modules/welcome/welcome_binding.dart';
import 'package:healthcare_mobile/routes/app_routes.dart';

class AppPages {
  static var getPages = [
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.SIGN_UP,
      page: () => SignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: AppRoutes.SPLASH_SCREEN,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.WELCOME,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: AppRoutes.MAIN_NAVIGATION,
      page: () => MainNavigation(),
      binding: MainNavigationBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME_PAGE,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.CHAT_PAGE,
      page: () => ChatPage(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: AppRoutes.PERSONAL_PAGE,
      page: () => PersonalPage(),
      binding: PersonalBinding(),
    ),
    GetPage(
      name: AppRoutes.APPOINMENT_PAGE,
      page: () => AppointmentForm(),
      binding: DoctorBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.MESSAGE_PAGE,
    //   page: () => MessagesPage(chat: ,),
    //   binding: MessagesBinding(),
    // ),
    GetPage(
      name: AppRoutes.CHAT_GPT_PAGE,
      page: () => GptScreen(),
      binding: GptBinding(),
    ),
    GetPage(
      name: AppRoutes.HEALTH_RECORD_PAGE,
      page: () => HealthRecordPage(),
      binding: HealthRecordBinding(),
    ),
    GetPage(
      name: AppRoutes.BLOOD_PRESSURE_PAGE,
      page: () => BloodPressurePage(),
      binding: BloodPressureBinding(),
    ),
    GetPage(
      name: AppRoutes.BMI_PAGE,
      page: () => BmiPage(),
      binding: BmiBinding(),
    ),
    GetPage(
      name: AppRoutes.HEARTBEAT_PAGE,
      page: () => HeartbeatPage(),
      binding: HeartbeatBinding(),
    ),
    GetPage(
      name: AppRoutes.CHOLESTEROL_PAGE,
      page: () => CholesterolPage(),
      binding: CholesterolBinding(),
    ),
    GetPage(
      name: AppRoutes.GLUCOSE_PAGE,
      page: () => GlucosePage(),
      binding: GlucoseBinding(),
    ),
    GetPage(
      name: AppRoutes.NOTIFICATION_PAGE,
      page: () => NotificationPage(),
      binding: NotificationBinding(),
    ),
  ];
}

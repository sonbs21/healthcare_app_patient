import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/appointment/appointment_form.dart';
import 'package:healthcare_mobile/modules/blood_pressure/blood_pressure_binding.dart';
import 'package:healthcare_mobile/modules/blood_pressure/blood_pressure_page.dart';
import 'package:healthcare_mobile/modules/bmi/bmi_binding.dart';
import 'package:healthcare_mobile/modules/bmi/bmi_page.dart';
import 'package:healthcare_mobile/modules/call/call_binding.dart';
import 'package:healthcare_mobile/modules/call/call_page.dart';
import 'package:healthcare_mobile/modules/call_video/call_video_binding.dart';
import 'package:healthcare_mobile/modules/call_video/call_video_page.dart';
import 'package:healthcare_mobile/modules/change-password/change_password_binding.dart';
import 'package:healthcare_mobile/modules/change-password/change_password_page.dart';
import 'package:healthcare_mobile/modules/chat/chat_binding.dart';
import 'package:healthcare_mobile/modules/chat/chat_page.dart';
import 'package:healthcare_mobile/modules/chat/gpt/screens/gpt_binding.dart';
import 'package:healthcare_mobile/modules/chat/gpt/screens/gpt_screen.dart';
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
import 'package:healthcare_mobile/modules/otp/otp_binding.dart';
import 'package:healthcare_mobile/modules/otp/otp_page.dart';
import 'package:healthcare_mobile/modules/otp_pass/otp_pass_binding.dart';
import 'package:healthcare_mobile/modules/otp_pass/otp_pass_page.dart';
import 'package:healthcare_mobile/modules/personal-info/personal_info_binding.dart';
import 'package:healthcare_mobile/modules/personal-info/personal_info_pages.dart';
import 'package:healthcare_mobile/modules/personal-update/personal_update_binding.dart';
import 'package:healthcare_mobile/modules/personal-update/personal_update_pages.dart';
import 'package:healthcare_mobile/modules/personal/personal_binding.dart';
import 'package:healthcare_mobile/modules/personal/personal_pages.dart';
import 'package:healthcare_mobile/modules/phone_pass/phone_pass_binding.dart';
import 'package:healthcare_mobile/modules/phone_pass/phone_pass_pages.dart';
import 'package:healthcare_mobile/modules/reset_password/reset_password_binding.dart';
import 'package:healthcare_mobile/modules/reset_password/reset_password_page.dart';
import 'package:healthcare_mobile/modules/select-doctor/select_doctor_binding.dart';
import 'package:healthcare_mobile/modules/select-doctor/select_doctor_page.dart';
import 'package:healthcare_mobile/modules/select-doctor/widget/info_select_doctor_binding.dart';
import 'package:healthcare_mobile/modules/select-doctor/widget/info_select_doctor_pages.dart';
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
    GetPage(
      name: AppRoutes.CHANGE_PASSWORD_PAGE,
      page: () => ChangePasswordPage(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.PERSONAL_INFO_PAGE,
      binding: PersonalInfoBinding(),
      page: () => PersonalInfoPage(),
    ),
    GetPage(
      name: AppRoutes.OTP_PAGE,
      binding: OtpBinding(),
      page: () => OtpPage(),
    ),
    GetPage(
      name: AppRoutes.PERSONAL_UPDATE_PAGE,
      binding: PersonalUpdateBinding(),
      page: () => PersonalUpdatePage(),
    ),
    GetPage(
      name: AppRoutes.SELECT_DOCTOR_PAGE,
      binding: SelectDoctorBinding(),
      page: () => SelectDoctorPage(),
    ),
    GetPage(
      name: AppRoutes.INFO_SELECT_DOCTOR_PAGE,
      binding: InfoSelectDoctorBinding(),
      page: () => InfoSelectDoctorPage(),
    ),
    GetPage(
      name: AppRoutes.CALL_PAGE,
      binding: CallBinding(),
      page: () => CallPage(),
    ),
    GetPage(
      name: AppRoutes.CALL_VIDEO_PAGE,
      binding: CallVideoBinding(),
      page: () => CallScreen(),
    ),
    GetPage(
      name: AppRoutes.PHONE_PASS_PAGE,
      binding: PhonePassBinding(),
      page: () => PhonePassPage(),
    ),

    GetPage(
      name: AppRoutes.OTP_PASS_PAGE,
      binding: OtpPassBinding(),
      page: () => OtpPassPage(),
    ),
    GetPage(
      name: AppRoutes.RESET_PASSWORD_PAGE,
      binding: ResetPasswordBinding(),
      page: () => ResetPasswordPage(),
    ),
    // Hero()
  ];
}

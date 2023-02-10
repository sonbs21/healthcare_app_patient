import 'package:get/get.dart';
import 'package:healcare_mobile/modules/chat/chat_binding.dart';
import 'package:healcare_mobile/modules/chat/chat_page.dart';
import 'package:healcare_mobile/modules/home/home_binding.dart';
import 'package:healcare_mobile/modules/home/home_pages.dart';
import 'package:healcare_mobile/modules/login/login_binding.dart';
import 'package:healcare_mobile/modules/login/login_page.dart';
import 'package:healcare_mobile/modules/main-navigation/main_navigation.dart';
import 'package:healcare_mobile/modules/main-navigation/main_navigation_binding.dart';
import 'package:healcare_mobile/modules/personal/personal_binding.dart';
import 'package:healcare_mobile/modules/personal/personal_pages.dart';
import 'package:healcare_mobile/modules/sign_up/sign_up_binding.dart';
import 'package:healcare_mobile/modules/sign_up/sign_up_page.dart';
import 'package:healcare_mobile/modules/splash/splash_binding.dart';
import 'package:healcare_mobile/modules/splash/splash_page.dart';
import 'package:healcare_mobile/modules/welcome/view/welcome_page.dart';
import 'package:healcare_mobile/modules/welcome/welcome_binding.dart';
import 'package:healcare_mobile/routes/app_routes.dart';


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
  ];
}

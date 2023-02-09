import 'package:get/get.dart';
import 'package:healcare_mobile/modules/login/login_binding.dart';
import 'package:healcare_mobile/modules/login/login_page.dart';
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
  ];
}

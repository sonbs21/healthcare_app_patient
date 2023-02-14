import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {

   var pageController = PageController();
  List<Widget> pages = [];
  var selectedIndex = 0;
  var isLogin = false.obs;
  var currentIndexWalkThrough = 0.obs;
  // var authService = Get.find<AuthService>();

  var selectedLanguage = "VN".obs;

  Timer? timer;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
    checkLogin();
    timer = Timer.periodic(const Duration(seconds: 3), (Timer t) => autoLoop());
  }

 

  void checkLogin() {
    // authService.getUid().then(
    //   (value) {
    //     if (value == null) {
    //     } else {
    //       // Get.offNamed(AppRoutes().DASHBOARD);
    //     }
    //   },
    // );
  }

  void autoLoop() {
    if (currentIndexWalkThrough.value == 3) {
      currentIndexWalkThrough.value = 0;
    } else {
      currentIndexWalkThrough.value += 1;
    }
    if (pageController.hasClients) {
      pageController.jumpToPage(currentIndexWalkThrough.value);
    }
  }
}
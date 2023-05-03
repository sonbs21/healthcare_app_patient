import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/routes/app_routes.dart';
import 'package:healthcare_mobile/service/local_storage_service.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    checkFirstSeen();
  }

  Future checkFirstSeen() async {
    await Future.delayed(const Duration(seconds: 4, milliseconds: 30));
    Get.back();
   /*

    if(LocalStorage.getItem == null && LocalStorage.getItem het han) {

       Get.offNamed(AppRoutes.WELCOME);
    }

    else{

      // co username, pd
      call login function
    }
   */
    Get.offNamed(AppRoutes.WELCOME);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: 150.h,
                  width: 150.h,
                ),
                SizedBox(
                  width: 50.w,
                ),
                Text(
                  "CardioCare",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 150.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 100.h,
            ),
            _buildAnimations(),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimations() {
    return Lottie.asset(
      'assets/animation/todo.json',
      height: 300,
      width: 300,
    );
  }
}

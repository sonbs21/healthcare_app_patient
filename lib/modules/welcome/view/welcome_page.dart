import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/welcome/welcome_controller.dart';
import 'package:healthcare_mobile/routes/app_routes.dart';
import 'package:healthcare_mobile/utils/color.dart';
import 'package:healthcare_mobile/utils/constant.dart';
import 'package:nb_utils/nb_utils.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);
  final walkThroughController = Get.find<WelcomeController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: textColorPrimary,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              30.height,
              Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Obx(
                      () => _buildDropdownLanguage(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      TCAppName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 200.sp,
                          letterSpacing: 2),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * .52,
                    child: PageView(
                      controller: walkThroughController.pageController,
                      scrollDirection: Axis.horizontal,
                      children: initPage(),
                      onPageChanged: (index) {
                        walkThroughController.currentIndexWalkThrough.value =
                            index;
                      },
                    ),
                  ),
                  40.height,
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    child: DotIndicator(
                        pages: initPage(),
                        indicatorColor: Colors.white,
                        pageController: walkThroughController.pageController),
                  ),
                ],
              ),
              20.height,
              Container(
                padding: EdgeInsets.fromLTRB(0, 15.w, 0, 15.w),
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 400.w,
                          height: 200.h,
                          child: ElevatedButton(
                            onPressed: () async {
                              Get.toNamed(AppRoutes.SIGN_UP);
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                                primary: buttonColor),
                            child: Text("Đăng ký".tr,
                                style: TextStyle(
                                    color: textColorPrimary, fontSize: 56.sp)),
                          ),
                        ),
                        SizedBox(
                          width: 400.w,
                          height: 200.h,
                          child: ElevatedButton(
                            onPressed: () async {
                              Get.toNamed(AppRoutes.LOGIN);
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                                primary: buttonColor),
                            child: Text("Đăng nhập".tr,
                                style: TextStyle(
                                    color: textColorPrimary, fontSize: 56.sp)),
                          ),
                        ),
                      ],
                    ),
                    30.height,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownLanguage() {
    String selectedLanguage = walkThroughController.selectedLanguage.value;
    return DropdownButton<String>(
      underline: Container(),
      iconSize: 0,
      // hint: languageService.loadLanguageFromBox() == "VN"
      //     ? Flag.fromCode(
      //         FlagsCode.VN,
      //         width: 60,
      //         height: 30,
      //       )
      //     : Flag.fromCode(
      //         FlagsCode.US,
      //         width: 60,
      //         height: 30,
      //       ),
      items: [
        DropdownMenuItem(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flag.fromCode(
                FlagsCode.VN,
                width: 50,
                height: 25,
              ),
              Text("Tiếng Việt"),
            ],
          ),
          value: "VN",
        ),
        DropdownMenuItem(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flag.fromCode(
                FlagsCode.US,
                width: 50,
                height: 25,
              ),
              Text("English"),
            ],
          ),
          value: "US",
        ),
      ],
      onChanged: (value) {
        walkThroughController.selectedLanguage.value = value!;
        // if (value == "US") {
        //   languageService.saveLanguageToBox("US");
        //   var locale = const Locale('en', 'US');
        //   Get.updateLocale(locale);
        // } else {
        //   languageService.saveLanguageToBox("VN");
        //   var locale = const Locale('vi', 'VN');
        //   Get.updateLocale(locale);
        // }
      },
    );
  }

  // Future<dynamic> openBottomSheetSignUp() {
  //   return Get.bottomSheet(Container(
  //     height: 480.h,
  //     width: Get.width,
  //     color: Colors.white,
  //     child: Column(
  //       children: [
  //         buildItemAuth(
  //           label: "signUpEmailLabel".tr,
  //           iconPath: "assets/icons/email.png",
  //           onClick: () {
  //             Get.toNamed(AppRoutes.SIGN_UP);
  //           },
  //         ),
  //         buildItemAuth(
  //           label: "signUpGoogleLabel".tr,
  //           iconPath: "assets/icons/google.png",
  //           onClick: () {},
  //         ),
  //       ],
  //     ),
  //   ));
  // }

  // Future<dynamic> openBottomSheetSignIn() {
  //   return Get.bottomSheet(Container(
  //     height: 480.h,
  //     width: Get.width,
  //     color: Colors.white,
  //     child: Column(
  //       children: [
  //         buildItemAuth(
  //             label: "signInEmailLabel".tr,
  //             iconPath: "assets/icons/email.png",
  //             onClick: () {
  //               Get.toNamed(AppRoutes.SIGN_IN);
  //             }),
  //         buildItemAuth(
  //           label: "signInGoogleLabel".tr,
  //           iconPath: "assets/icons/google.png",
  //           onClick: () {
  //             walkThroughController.signInByGoogleAccount().then(
  //               (value) {
  //                 Get.offAllNamed(
  //                   AppRoutes.DASHBOARD,
  //                 );
  //                 EasyLoading.dismiss();
  //               },
  //             );
  //           },
  //         ),
  //       ],
  //     ),
  //   ));
  // }

  initPage() {
    return [
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/walkthrough1.jpg",
              height: 250,
            ),
            40.height,
            SizedBox(
              width: 300,
              // child: Text(
              //   "title_walk_through_1".tr,
              //   style: boldTextStyle(
              //     color: textColorPrimary,
              //     size: 20,
              //     letterSpacing: 1,
              //   ),
              //   textAlign: TextAlign.center,
              // ),
            ),
            const SizedBox(
              height: 5,
            ),
            // SizedBox(
            //   width: 400,
            //   child: Text(
            //     "description_walk_through_1".tr,
            //     style:
            //         primaryTextStyle(color: textColorPrimary, letterSpacing: 1),
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            // commonCacheImageWidget(tc_WalkThroughImg1.validate(), height: 230),
          ],
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/walkthrough2.jpg",
            height: 250,
          ),
          40.height,
          SizedBox(
            width: 250,
            // child: Text(
            //   "title_walk_through_2".tr,
            //   style: boldTextStyle(
            //       color: textColorPrimary, size: 20, letterSpacing: 1),
            //   textAlign: TextAlign.center,
            // ),
          ),
          const SizedBox(
            height: 5,
          ),
          // SizedBox(
          //   width: 340,
          //   child: Text(
          //     "description_walk_through_2".tr,
          //     style:
          //         primaryTextStyle(color: textColorPrimary, letterSpacing: 1),
          //     textAlign: TextAlign.center,
          //   ),
          // ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/walkthrough3.jpg",
            height: 250,
          ),
          40.height,
          // Text(
          //   "title_walk_through_3".tr,
          //   style: boldTextStyle(
          //       color: textColorPrimary, size: 20, letterSpacing: 1),
          // ),
          const SizedBox(
            height: 5,
          ),
          // SizedBox(
          //     width: 260,
          //     child: Text(
          //       "description_walk_through_3".tr,
          //       style: primaryTextStyle(
          //         color: textColorPrimary,
          //         letterSpacing: 1,
          //       ),
          //       textAlign: TextAlign.center,
          //     )),
        ],
      ),
      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Image.asset(
      //       "assets/images/walkthrough4.png",
      //       height: 250,
      //     ),
      //     40.height,
      //     Text(
      //       "title_walk_through_4".tr,
      //       style: boldTextStyle(
      //           color: textColorPrimary, size: 20, letterSpacing: 1),
      //     ),
      //     const SizedBox(
      //       height: 5,
      //     ),
      //     SizedBox(
      //       width: 340,
      //       child: Text(
      //         "description_walk_through_4".tr,
      //         style: primaryTextStyle(
      //           color: textColorPrimary,
      //           letterSpacing: 1,
      //         ),
      //         textAlign: TextAlign.center,
      //       ),
      //     ),
      //   ],
      // ),
    ];
  }
}

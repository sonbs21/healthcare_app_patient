import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare_mobile/modules/appointment/appointment.controller.dart';
import 'package:healthcare_mobile/modules/chat/gpt/providers/chats_provider.dart';
import 'package:healthcare_mobile/modules/chat/gpt/providers/models_provider.dart';
import 'package:healthcare_mobile/repository/appointment.repository.dart';
import 'package:healthcare_mobile/routes/app_pages.dart';
import 'package:healthcare_mobile/routes/app_routes.dart';
import 'package:healthcare_mobile/service/local_storage_service.dart';
import 'package:provider/provider.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => LocalStorageService.init());
   await Firebase.initializeApp();
  runApp(MyApp());
  Get.lazyPut(() => AppointmentRepository(), fenix: true);

  Get.put(AppointmentController());

  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: const Color(0xFF9D50DD),
            ledColor: Colors.white)
      ],
      debug: true);
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ModelsProvider()),
          ChangeNotifierProvider(create: (_) => ChatProvider())
        ],
        child: ScreenUtilInit(
          designSize: const Size(1440, 3040),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, __) => GetMaterialApp(
            // initialBinding: BindingsBuilder(() {
            //   // Get.lazyPut(() => SocketService());
            // }),
            fallbackLocale: const Locale('en',
                'US'), // specify the fallback locale in case an invalid locale is selected.

            debugShowCheckedModeBanner: false,
            getPages: AppPages.getPages,

            // set font for all project
            theme: ThemeData(
              textTheme: GoogleFonts.robotoTextTheme(
                Theme.of(context).textTheme,
              ),
            ),
            initialRoute: AppRoutes.SPLASH_SCREEN,
            builder: (ctx, child) {
              child = EasyLoading.init()(ctx, child);
              // ScreenUtil.setContext(ctx);

              return child;
            },
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate
            ],
          ),
        ));
  }
}

import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/splash/splash_controller.dart';
import 'package:healthcare_mobile/repository/health_record.repository.dart';
import 'package:healthcare_mobile/repository/user.repository.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => UserRepository(), fenix: true);
    Get.lazyPut(() => HealthRecordRepository(), fenix: true);
  }
}

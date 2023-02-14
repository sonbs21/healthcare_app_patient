import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/health-record/health_record_controller.dart';

class HealthRecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HealthRecordController());
  }
}

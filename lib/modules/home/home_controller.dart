import 'package:get/get.dart';
import 'package:healthcare_mobile/models/health-record/health_record_response.dart';
import 'package:healthcare_mobile/repository/health_record.repository.dart';

class HomeController extends GetxController {
  final healthRecordRepository = Get.find<HealthRecordRepository>();
  RxList<DataResponse> list = RxList<DataResponse>([]);

  @override
  void onInit() {
    super.onInit();
    initList();
  }

  void initList() async {
    final response = await healthRecordRepository.getHealthRecordAllDay();
    if (response.statusCode == 200) {
      // listBmi = response.data;
      list.clear();
      list.addAll(response.data);
    } else {
      // Xử lý khi API trả về lỗi
    }
  }
}

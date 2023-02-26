import 'package:get/get.dart';
import 'package:healthcare_mobile/models/health-record/health_record_response.dart';
import 'package:healthcare_mobile/repository/health_record.repository.dart';

class BloodPressureController extends GetxController {
  final healthRecordRepository = Get.find<HealthRecordRepository>();
  // var listBmi = RxList<DataResponse>([]);
// List<DataResponse> listBloodPressure = [];
RxList<DataResponse> listBloodPressure = RxList<DataResponse>([]);
  @override
  void onInit() {
    super.onInit();
    initListBloodPressure();
  }

  void initListBloodPressure() async {
    final response = await healthRecordRepository.getBloodPressure();
    if (response.statusCode == 200) {
      listBloodPressure.addAll(response.data);
      // listBloodPressure = response.data.obs;
      // update();
    } else {
      // Xử lý khi API trả về lỗi
    }
  }
}
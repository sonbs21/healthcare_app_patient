import 'package:get/get.dart';
import 'package:healthcare_mobile/models/health-record/health_record_response.dart';
import 'package:healthcare_mobile/repository/health_record.repository.dart';


class GlucoseController extends GetxController {
    final healthRecordRepository = Get.find<HealthRecordRepository>();
  RxList<DataResponse> listGlucose = RxList<DataResponse>([]);

  @override
  void onInit() {
    super.onInit();
    initListGlucose();
  }

  void initListGlucose() async {
    final response = await healthRecordRepository.getGlucose();
    if (response.statusCode == 200) {
      // listBmi = response.data;
      listGlucose.addAll(response.data);
    } else {
      // Xử lý khi API trả về lỗi
    }
  }
}
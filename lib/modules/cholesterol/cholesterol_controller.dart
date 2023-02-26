import 'package:get/get.dart';
import 'package:healthcare_mobile/models/health-record/health_record_response.dart';
import 'package:healthcare_mobile/repository/health_record.repository.dart';

class CholesterolController extends GetxController {
  final healthRecordRepository = Get.find<HealthRecordRepository>();
  RxList<DataResponse> listCholesterol = RxList<DataResponse>([]);

  @override
  void onInit() {
    super.onInit();
    initListCholesterol();
  }

  void initListCholesterol() async {
    final response = await healthRecordRepository.getCholesterol();
    if (response.statusCode == 200) {
      // listBmi = response.data;
      listCholesterol.addAll(response.data);
    } else {
      // Xử lý khi API trả về lỗi
    }
  }
}

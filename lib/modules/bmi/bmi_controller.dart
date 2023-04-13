import 'dart:math';

import 'package:get/get.dart';
import 'package:healthcare_mobile/models/health-record/health_record_response.dart';
import 'package:healthcare_mobile/repository/health_record.repository.dart';

class BmiController extends GetxController {
  final healthRecordRepository = Get.find<HealthRecordRepository>();
  // var listBmi = RxList<DataResponse>([]);
// List<DataResponse> listBmi = [];
  RxList<DataResponse> listBmi = RxList<DataResponse>([]);

  @override
  void onInit() {
    super.onInit();
    initListBmi();
  }

  void initListBmi() async {
    final response = await healthRecordRepository.getBmi();
    if (response.statusCode == 200) {
      // listBmi = response.data;
      listBmi.addAll(response.data);
    } else {
      // Xử lý khi API trả về lỗi
    }
  }
}

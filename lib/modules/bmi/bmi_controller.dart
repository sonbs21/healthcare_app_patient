import 'dart:math';

import 'package:get/get.dart';
import 'package:healthcare_mobile/models/health-record/health_record_response.dart';
import 'package:healthcare_mobile/repository/health_record.repository.dart';

class BmiController extends GetxController {
  var listBmi = <DataResponse>[].obs;
  final healthRecordRepository = Get.find<HealthRecordRepository>();
  @override
  void onInit() {
    // listLabelColor.value = Common.getListLabelColor();
    initListBmi();
    // loadBoard();
    // initListMember();
    // initBoardHistorical();
    super.onInit();
  }

  void initListBmi() {
    // healthRecordRepository.getBmi().then((value) => listBmi = value.data);
  }
}

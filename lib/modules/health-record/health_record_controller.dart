import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/models/health-record/health_record_request.dart';
import 'package:healthcare_mobile/repository/health_record.repository.dart';

class HealthRecordController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var formKeyDialog = GlobalKey<FormState>();
  var heightController = TextEditingController();
  var weightController = TextEditingController();
  var systolicController = TextEditingController();
  var diastolicController = TextEditingController();
  var heartRateIndicatorController = TextEditingController();
  var cholesterolController = TextEditingController();
  var glucoseController = TextEditingController();
  var isButtonLoading = false.obs;

  final healthRecordRepository = Get.find<HealthRecordRepository>();
  void postHealthRecord(String height, String weight, String systolic, String diastolic,
      String heartRateIndicator, String glucose, String cholesterol) async {

    if (formKey.currentState!.validate()) {
      isButtonLoading.value = true;

      try {
        await healthRecordRepository
            .postHealthRecord(HealthRecordRequest(
                height: height,
                weight: weight,
                systolic: systolic,
                diastolic: diastolic,
                heartRateIndicator: heartRateIndicator,
                cholesterol: cholesterol,
                glucose: glucose))
            .then((value) {
          // Get.offAllNamed(AppRoutes.MAIN_NAVIGATION);
        });
      } on DioError catch (e) {
        EasyLoading.showError(e.response?.data['message']);
      }
    }

    isButtonLoading.value = false;
  }
}

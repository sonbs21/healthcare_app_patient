import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/models/health-record/health_record_request.dart';
import 'package:healthcare_mobile/modules/dialog/record_dialog.dart';
import 'package:healthcare_mobile/modules/home/home_controller.dart';
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
  final homeController = Get.find<HomeController>();

  final healthRecordRepository = Get.find<HealthRecordRepository>();
  void postHealthRecord(
      String height,
      String weight,
      String systolic,
      String diastolic,
      String heartRateIndicator,
      String glucose,
      String cholesterol,
      BuildContext context) async {
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
          homeController.initList();
          print('object${value.data?.cholesterol}');
          Get.back();
          showDialog(
              context: context,
              builder: (BuildContext context) => RecordDialog(
                    messageBmi: value.data?.recordBmi?.message,
                    statusBmi: value.data?.recordBmi?.status,
                    indexBmi: value.data?.indexBmi,
                    glucose: value.data?.glucose,
                    messageGlucose: value.data?.recordGlucose?.message,
                    statusGlucose: value.data?.recordGlucose?.status,
                    cholesterol: value.data?.cholesterol,
                    messageCholesterol: value.data?.recordCholesterol?.message,
                    statusCholesterol: value.data?.recordCholesterol?.status,
                    heartRateIndicator: value.data?.heartRateIndicator,
                    statusHeartbeat: value.data?.recordHeartBeat?.status,
                    messageHeartbeat: value.data?.recordHeartBeat?.message,
                    systolic: value.data?.systolic,
                    diastolic: value.data?.diastolic,
                    messageBloodPressure:
                        value.data?.recordBloodPressure?.message,
                    statusBloodPressure:
                        value.data?.recordBloodPressure?.status,
                    status: value.data?.status,
                    createdAt: value.data?.createdAt,
                  ));
        });
      } on DioError catch (e) {
        EasyLoading.showError(e.response?.data['message']);
      }
    }

    isButtonLoading.value = false;
  }
}

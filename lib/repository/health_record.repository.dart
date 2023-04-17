import 'package:dio/dio.dart';
import 'package:healthcare_mobile/api/rest_api.dart';
import 'package:healthcare_mobile/models/health-record/health_record_day_response.dart';
import 'package:healthcare_mobile/models/health-record/health_record_request.dart';
import 'package:healthcare_mobile/models/health-record/health_record_response.dart';
import 'package:healthcare_mobile/models/health-record/record_day_response.dart';
import 'package:healthcare_mobile/service/local_storage_service.dart';

class HealthRecordRepository {
  final dio = Dio(); // Provide a dio instance

  Future<RecordDayResponse> postHealthRecord(HealthRecordRequest dto) async {
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response =
        await dio.post('http://10.0.2.2:5000/v1/health-record', data: {
      "height": dto.height,
      "weight": dto.weight,
      "heartRateIndicator": dto.heartRateIndicator,
      "cholesterol": dto.cholesterol,
      "systolic": dto.systolic,
      "diastolic": dto.diastolic,
      "glucose": dto.glucose,
    });
    return RecordDayResponse.fromJson(response.data) ;
  }

  Future<HealthRecordDayResponse> getHealthRecordDay() async {
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.get(
      'http://10.0.2.2:5000/v1/health-record-day',
    );
    return HealthRecordDayResponse.fromJson(response.data);
  }

  Future<HealthRecordResponse> getBmi() async {
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.get(
      'http://10.0.2.2:5000/v1/get-bmi',
    );
    return HealthRecordResponse.fromJson(response.data);
  }

  Future<HealthRecordResponse> getBloodPressure() async {
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.get(
      'http://10.0.2.2:5000/v1/get-blood-pressure',
    );
    return HealthRecordResponse.fromJson(response.data);
  }

  Future<HealthRecordResponse> getCholesterol() async {
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.get(
      'http://10.0.2.2:5000/v1/get-cholesterol',
    );
    return HealthRecordResponse.fromJson(response.data);
  }

  Future<HealthRecordResponse> getHeartbeat() async {
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.get(
      'http://10.0.2.2:5000/v1/get-heartbeat',
    );
    return HealthRecordResponse.fromJson(response.data);
  }

  Future<HealthRecordResponse> getGlucose() async {
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.get(
      'http://10.0.2.2:5000/v1/get-glucose',
    );
    return HealthRecordResponse.fromJson(response.data);
  }

  Future<HealthRecordResponse> getHealthRecordAllDay() async {
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.get(
      'http://10.0.2.2:5000/v1/health-record-member',
    );
    return HealthRecordResponse.fromJson(response.data);
  }
}

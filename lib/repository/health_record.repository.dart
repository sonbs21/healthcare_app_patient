import 'package:dio/dio.dart';
import 'package:healthcare_mobile/api/rest_api.dart';
import 'package:healthcare_mobile/models/health-record/health_record_day_response.dart';
import 'package:healthcare_mobile/models/health-record/health_record_request.dart';
import 'package:healthcare_mobile/models/health-record/health_record_response.dart';

class HealthRecordRepository {
  final dio = Dio(); // Provide a dio instance

  Future<void> postHealthRecord(
      HealthRecordRequest dto) async {
    final client = RestClient(dio);
    return await client.postHealthRecord(dto);
  }

  Future<HealthRecordDayResponse> getHealthRecordDay() async {
    final client = RestClient(dio);
    return await client.getHealthRecordDay();
  }

  Future<HealthRecordResponse> getBmi() async {
    final client = RestClient(dio);
    return await client.getBmi();
  }

  Future<HealthRecordResponse> getBloodPressure() async {
    final client = RestClient(dio);
    return await client.getBloodPressure();
  }

  Future<HealthRecordResponse> getCholesterol() async {
    final client = RestClient(dio);
    return await client.getCholesterol();
  }

  Future<HealthRecordResponse> getHeartbeat() async {
    final client = RestClient(dio);
    return await client.getHeartbeat();
  }

  Future<HealthRecordResponse> getGlucose() async {
    final client = RestClient(dio);
    return await client.getGlucose();
  }

  Future<HealthRecordResponse> getHealthRecordAllDay() async {
    final client = RestClient(dio);
    return await client.getHealthRecordAllDay();
  }
}

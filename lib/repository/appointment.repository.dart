import 'package:dio/dio.dart';
import 'package:healthcare_mobile/api/rest_api.dart';
import 'package:healthcare_mobile/models/appointment/appointment_response.dart';

class AppointmentRepository {
  final dio = Dio(); // Provide a dio instance

  // Future<void> postHealthRecord(
  //     HealthRecordRequest dto) async {
  //   final client = RestClient(dio);
  //   return await client.postHealthRecord(dto);
  // }

  Future<AppointmentResponse> getAppointmentPatient() async {
    final client = RestClient(dio);
    return await client.getAppointmentPatient();
  }
}

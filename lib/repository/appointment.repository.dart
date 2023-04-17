import 'package:dio/dio.dart';
import 'package:healthcare_mobile/api/rest_api.dart';
import 'package:healthcare_mobile/models/appointment/appointment_get_response.dart';
import 'package:healthcare_mobile/models/appointment/appointment_request.dart';
import 'package:healthcare_mobile/models/appointment/appointment_response.dart';
import 'package:healthcare_mobile/models/appointment/appointment_time_response.dart';
import 'package:healthcare_mobile/service/local_storage_service.dart';
import 'package:healthcare_mobile/models/notifications/notification_response.dart';

class AppointmentRepository {
  final dio = Dio(); // Provide a dio instance

  // Future<void> postHealthRecord(
  //     HealthRecordRequest dto) async {
  //   final client = RestClient(dio);
  //   return await client.postHealthRecord(dto);
  // }

  // Future<AppointmentResponse> getAppointmentPatient(
  //     int? page, int? pageSize, String? status) async {
  Future<AppointmentResponse> getAppointmentPatient(
    int? page,
    int? pageSize,
    String? status,
  ) async {
    print('object:${status}');
    print('object:${status != null || status != ''}');
    final queryParams = {
      'page': page ?? 1,
      'pageSize': pageSize ?? 10,
      if (status != null && status != '') 'status': status,
    };
    // if (status != null) {
    //   queryParams['status'] = status;
    // }
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.get(
      'http://10.0.2.2:5000/v1/get-appointment-patient',
      queryParameters: queryParams,
    );

    return AppointmentResponse.fromJson(response.data);
  }
  // return await client.getAppointmentPatient();
  // }

  Future<NotificationResponse> getNotification(
    int? page,
    int? pageSize,
  ) async {
    final queryParams = {
      'page': page ?? 1,
      'pageSize': pageSize ?? 20,
    };
    // if (status != null) {
    //   queryParams['status'] = status;
    // }
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.get(
      'http://10.0.2.2:5000/v1/get-notifications',
      queryParameters: queryParams,
    );

    return NotificationResponse.fromJson(response.data);
  }

  Future<AppointmentTimeResponse> getAppointmentTime(
    String? doctorId,
    DateTime? timeDate,
  ) async {
    final queryParams = {
      'doctorId': doctorId,
      'timeDate': timeDate,
    };
    print("+==sss==${timeDate}");

    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.get(
      'http://10.0.2.2:5000/v1/appointment-time',
      queryParameters: queryParams,
    );

    print("+====${response.data}");

    return AppointmentTimeResponse.fromJson(response.data);
  }

  Future<AppointmentGetResponse> postAppointment(AppointmentRequest dto) async {
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response =
        await dio.post('http://10.0.2.2:5000/v1/appointment', data: {
      "dateMeeting": dto.dateMeeting,
      "dateOfBirth": dto.dateOfBirth,
      "fullName": dto.fullName,
      "notes": dto.notes,
      "phone": dto.phone,
      "timeMeeting": dto.timeMeeting
    });
    return AppointmentGetResponse.fromJson(response.data);
  }

  Future<AppointmentGetResponse> cancelAppointment(String id) async {
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.put(
      'http://10.0.2.2:5000/v1/appointment/$id/cancel',
    );

    return AppointmentGetResponse.fromJson(response.data);
  }
}

import 'package:dio/dio.dart';
import 'package:healthcare_mobile/models/appointment/appointment_get_response.dart';
import 'package:healthcare_mobile/models/appointment/appointment_request.dart';
import 'package:healthcare_mobile/models/appointment/appointment_response.dart';
import 'package:healthcare_mobile/models/appointment/appointment_time_response.dart';
import 'package:healthcare_mobile/models/notifications/notification_response.dart';
import 'package:healthcare_mobile/service/local_storage_service.dart';
import 'package:healthcare_mobile/utils/constant.dart';
import 'package:intl/intl.dart';

class AppointmentRepository {
  final dio = Dio(); // Provide a dio instance

  Future<AppointmentResponse> getAppointmentPatient(
    int? page,
    int? pageSize,
    String? status,
  ) async {
    final queryParams = {
      'page': page ?? 1,
      'pageSize': pageSize ?? 10,
      if (status != null && status != '') 'status': status,
    };

    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.get(
      '$domain/get-appointment-patient',
      queryParameters: queryParams,
    );

    return AppointmentResponse.fromJson(response.data);
  }

  Future<NotificationResponse> getNotification(
    int? page,
  ) async {
    final queryParams = {
      'page': page ?? 1,
      'pageSize': 10,
    };

    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.get(
      '$domain/get-notifications',
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

    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.get(
      '$domain/appointment-time',
      queryParameters: queryParams,
    );
    return AppointmentTimeResponse.fromJson(response.data);
  }

  Future<Response> readAllNotification() async {
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.put(
      '$domain/notification/read-all',
    );

    return response;
  }

  Future<AppointmentGetResponse> postAppointment(AppointmentRequest dto) async {
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";
    String formattedDateOfBirth =
        DateFormat("yyyy-MM-dd").format(dto.dateOfBirth!);
    String formattedDateMeeting =
        DateFormat("yyyy-MM-dd").format(dto.dateMeeting!);

    final response = await dio.post('$domain/appointment', data: {
      "dateMeeting": formattedDateMeeting,
      "dateOfBirth": formattedDateOfBirth,
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
      '$domain/appointment/$id/cancel',
    );

    return AppointmentGetResponse.fromJson(response.data);
  }
}

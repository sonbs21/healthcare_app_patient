import 'dart:io';

import 'package:healthcare_mobile/models/appointment/appointment_get_response.dart';
import 'package:healthcare_mobile/models/appointment/appointment_request.dart';
import 'package:healthcare_mobile/models/appointment/appointment_response.dart';
import 'package:healthcare_mobile/models/chats/chat_response.dart';
import 'package:healthcare_mobile/models/chats/message_request.dart';
import 'package:healthcare_mobile/models/chats/message_response.dart';
import 'package:healthcare_mobile/models/health-record/health_record_day_response.dart';
import 'package:healthcare_mobile/models/health-record/health_record_request.dart';
import 'package:healthcare_mobile/models/health-record/health_record_response.dart';
import 'package:healthcare_mobile/models/health-record/record_day_response.dart';
import 'package:healthcare_mobile/models/login/login_request.dart';
import 'package:healthcare_mobile/models/login/login_response.dart';
import 'package:healthcare_mobile/models/notifications/notification_response.dart';
import 'package:healthcare_mobile/models/user/doctor_response.dart';
import 'package:healthcare_mobile/models/user/user_response.dart';
import 'package:healthcare_mobile/service/local_storage_service.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_api.g.dart';

@RestApi(baseUrl: "http://10.0.2.2:5000/v1/")
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) {
    dio.options = BaseOptions(receiveTimeout: 60000, connectTimeout: 60000);
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    return _RestClient(dio);
  }

  @POST('auth/user/login')
  Future<LoginResponse> loginUser(@Body() LoginRequest login);

  @GET('user/me')
  Future<UserResponse> getMe();

  @POST('health-record')
  Future<RecordDayResponse> postHealthRecord(@Body() HealthRecordRequest dto);

  @GET('health-record-day')
  Future<HealthRecordDayResponse> getHealthRecordDay();

  @GET('get-appointment-patient')
  Future<AppointmentResponse> getAppointmentPatient();

  @POST('appointment')
  Future<AppointmentGetResponse> postAppointment(
      @Body() AppointmentRequest dto);

  @PUT('appointment/{id}/cancel')
  Future<AppointmentGetResponse> cancelAppointment(
    @Path("id") String id,
  );

  @GET('get-bmi')
  Future<HealthRecordResponse> getBmi();

  @GET('get-heartbeat')
  Future<HealthRecordResponse> getHeartbeat();

  @GET('get-blood-pressure')
  Future<HealthRecordResponse> getBloodPressure();

  @GET('get-glucose')
  Future<HealthRecordResponse> getGlucose();

  @GET('get-cholesterol')
  Future<HealthRecordResponse> getCholesterol();

  @GET('doctor/{id}')
  Future<DoctorResponse> getDoctorById(@Path("id") String id);

  @GET('chat/{id}')
  Future<ChatResponse> getChat(@Path("id") String id,
      @Query("pageSize") int pageSize, @Query("page") int page);

  @POST('chat/{id}')
  Future<MessageResponse> postChat(@Path("id") String id,@Body() MessageRequest dto);

  @GET('health-record-member')
  Future<HealthRecordResponse> getHealthRecordAllDay();

  @GET('get-notifications')
  Future<NotificationResponse> getNotifications();

  @POST('user/logout')
  Future<void> logout();
}

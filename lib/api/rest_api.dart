import 'dart:io';

import 'package:healthcare_mobile/models/appointment/appointment_response.dart';
import 'package:healthcare_mobile/models/health-record/health_record_day_response.dart';
import 'package:healthcare_mobile/models/health-record/health_record_request.dart';
import 'package:healthcare_mobile/models/health-record/health_record_response.dart';
import 'package:healthcare_mobile/models/login/login_request.dart';
import 'package:healthcare_mobile/models/login/login_response.dart';
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
  Future<void> postHealthRecord(@Body() HealthRecordRequest dto);

  @GET('health-record-day')
  Future<HealthRecordDayResponse> getHealthRecordDay();

  @GET('get-appointment-patient')
  Future<AppointmentResponse> getAppointmentPatient();

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

  @GET('health-record-member')
  Future<HealthRecordResponse> getHealthRecordAllDay();

  @POST('user/logout')
  Future<void> logout();

}

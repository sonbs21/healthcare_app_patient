import 'package:dio/dio.dart';
import 'package:healthcare_mobile/models/login/login_request.dart';
import 'package:healthcare_mobile/models/login/login_response.dart';
import 'package:healthcare_mobile/models/rating/rating_request.dart';
import 'package:healthcare_mobile/models/register/register_request.dart';
import 'package:healthcare_mobile/models/register/select_doctor_request.dart';
import 'package:healthcare_mobile/models/user/doctor_lst_response.dart';
import 'package:healthcare_mobile/models/user/doctor_response.dart';
import 'package:healthcare_mobile/models/user/person_response.dart';
import 'package:healthcare_mobile/models/user/user_request.dart';
import 'package:healthcare_mobile/models/user/user_response.dart';
import 'package:healthcare_mobile/service/local_storage_service.dart';
import 'package:healthcare_mobile/utils/constant.dart';
import 'package:intl/intl.dart';

class UserRepository {
  final dio = Dio(); // Provide a dio instance

  Future<UserResponse> getMe() async {
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.get(
      '$domain/user/me',
    );
    return UserResponse.fromJson(response.data);
  }


  Future<PersonResponse> getPerson(String id) async {
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.get(
      '$domain/user/me/$id',
    );
    return PersonResponse.fromJson(response.data);
  }

  Future<LoginResponse> loginUser(LoginRequest login) async {
    // dio.options = BaseOptions();
    // dio.options.headers['Authorization'] =
    //     "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.post('$domain/auth/user/login',
        data: {"phone": login.phone, "password": login.password});
    return LoginResponse.fromJson(response.data);
  }

  Future<UserResponse> register(RegisterRequest dto) async {
    // dio.options = BaseOptions();
    // dio.options.headers['Authorization'] =
    //     "Bearer ${LocalStorageService.getAccessToken()}";
    String formattedDate = DateFormat("yyyy-MM-dd").format(dto.dateOfBirth!);
    // final carers = [
    //   {"phone": phoneCarer, "fullName": nameCarer}
    // ];
    final response = await dio
        .post('$domain/auth/user/register/patient', data: {
      "phone": dto.phone,
      "password": dto.password,
      "fullName": dto.fullName,
      "gender": dto.gender,
      "address": dto.address,
      "insuranceNumber": dto.insuranceNumber,
      "job": dto.job,
      "state": dto.state,
      "medicalHistory": dto.medicalHistory,
      "carers": dto.carers,
      "dateOfBirth": formattedDate,
    });
    return UserResponse.fromJson(response.data);
  }

  Future<DoctorResponse> getDoctorById(String id) async {
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.get(
      '$domain/doctor/$id',
    );
    return DoctorResponse.fromJson(response.data);
  }

  Future<void> postRating(RatingRequest dto) async {
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.post('$domain/auth/user/login',
        data: {"doctorId": dto.doctorId, "rating": dto.rating});
    return response.data;
  }

  Future<void> emergency() async {
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.post(
      '$domain/emergency',
    );
    return response.data;
  }

  Future<void> selectDoctor(SelectDoctorRequest dto) async {
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.put('$domain/patient/select',
        data: {"doctorId": dto.doctorId});
    return response.data;
  }

  // Future<void> logout() async {
  //   final client = RestClient(dio);
  //   return await client.logout();
  // }

  Future<DoctorLstResponse> getDoctors(
    int? page,
    int? pageSize,
  ) async {
    final queryParams = {
      'page': page ?? 1,
      'pageSize': pageSize ?? 10,
    };
    // if (status != null) {
    //   queryParams['status'] = status;
    // }
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.get(
      '$domain/doctors',
      queryParameters: queryParams,
    );

    return DoctorLstResponse.fromJson(response.data);
  }

  Future<Response> changePassword(
    String? oldPassword,
    String? newPassword,
    String? confirmNewPassword,
  ) async {
    // if (status != null) {
    //   queryParams['status'] = status;
    // }
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response =
        await dio.patch('$domain/user/change-password', data: {
      "oldPassword": oldPassword,
      "newPassword": newPassword,
      "confirmNewPassword": confirmNewPassword,
    });

    return response;
  }

  Future<UserResponse> update(UserRequest dto) async {
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";
    String formattedDate = DateFormat("yyyy-MM-dd").format(dto.dateOfBirth!);
    final response = await dio.patch('$domain/patient', data: {
      "fullName": dto.fullName,
      "address": dto.address,
      "gender": dto.gender,
      "dateOfBirth": formattedDate,
      "job": dto.job,
      "fullNameCarer": dto.fullNameCarer,
      "phoneCarer": dto.phoneCarer,
    });

    return UserResponse.fromJson(response.data);
  }

  // Future<UserResponse> updateUser(String uid, UserRequest userRequest) async {
  //   final client = RestClient(dio);
  //   return await client.updateUser(uid, userRequest);
  // }
}

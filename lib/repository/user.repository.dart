import 'package:dio/dio.dart';
import 'package:healthcare_mobile/models/login/login_request.dart';
import 'package:healthcare_mobile/models/login/login_response.dart';
import 'package:healthcare_mobile/models/rating/rating_request.dart';
import 'package:healthcare_mobile/models/user/doctor_lst_response.dart';
import 'package:healthcare_mobile/models/user/doctor_response.dart';
import 'package:healthcare_mobile/models/user/user_request.dart';
import 'package:healthcare_mobile/models/user/user_response.dart';
import 'package:healthcare_mobile/service/local_storage_service.dart';
import 'package:intl/intl.dart';

class UserRepository {
  final dio = Dio(); // Provide a dio instance

  Future<UserResponse> getMe() async {
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.get(
      'http://10.0.2.2:5000/v1/user/me',
    );
    return UserResponse.fromJson(response.data);
  }

  Future<LoginResponse> loginUser(LoginRequest login) async {
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.post('http://10.0.2.2:5000/v1/auth/user/login',
        data: {"phone": login.phone, "password": login.password});
    return LoginResponse.fromJson(response.data);
  }

  Future<DoctorResponse> getDoctorById(String id) async {
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.get(
      'http://10.0.2.2:5000/v1/doctor/$id',
    );
    return DoctorResponse.fromJson(response.data);
  }

  Future<void> postRating(RatingRequest dto) async {
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.post('http://10.0.2.2:5000/v1/auth/user/login',
        data: {"doctorId": dto.doctorId, "rating": dto.rating});
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
      'http://10.0.2.2:5000/v1/doctors',
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
        await dio.patch('http://10.0.2.2:5000/v1/user/change-password', data: {
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
    final response = await dio.patch('http://10.0.2.2:5000/v1/patient', data: {
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

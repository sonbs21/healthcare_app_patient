import 'package:dio/dio.dart';
import 'package:healthcare_mobile/api/rest_api.dart';
import 'package:healthcare_mobile/models/login/login_request.dart';
import 'package:healthcare_mobile/models/login/login_response.dart';
import 'package:healthcare_mobile/models/rating/rating_request.dart';
import 'package:healthcare_mobile/models/user/doctor_lst_response.dart';
import 'package:healthcare_mobile/models/user/doctor_response.dart';
import 'package:healthcare_mobile/models/user/user_response.dart';
import 'package:healthcare_mobile/service/local_storage_service.dart';

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

  // Future<List<UserResponse>> searchUserInWorkspace(
  //     String keyword, int workspace, int boardId) async {
  //   final client = RestClient(dio);
  //   return await client.searchUserInWorkspace(keyword, workspace, boardId);
  // }

  // Future<UserResponse> updateUser(String uid, UserRequest userRequest) async {
  //   final client = RestClient(dio);
  //   return await client.updateUser(uid, userRequest);
  // }
}

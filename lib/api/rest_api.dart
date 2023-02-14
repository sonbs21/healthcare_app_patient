import 'dart:io';

import 'package:healthcare_mobile/models/login/login_request.dart';
import 'package:healthcare_mobile/models/login/login_response.dart';
import 'package:healthcare_mobile/models/user/user_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_api.g.dart';

@RestApi(baseUrl: "http://10.0.2.2:5000/v1/")
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) {
    dio.options = BaseOptions(receiveTimeout: 60000, connectTimeout: 60000);
    
    return _RestClient(dio);
  }

  @POST('auth/user/login')
  Future<LoginResponse> loginUser(@Body() LoginRequest login);

  @GET('user/me')
  Future<UserResponse> getMe();
}

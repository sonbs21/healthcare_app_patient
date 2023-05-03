import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String? message;
  int? statusCode;
  DataResponse? data;

  LoginResponse({
    this.data,
    this.statusCode,
    this.message,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class DataResponse {
  String access_token;
  String refresh_token;
  String? role;
  String? memberId;

  DataResponse(
      {required this.access_token,
      required this.refresh_token,
      this.role,
      this.memberId});

  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}

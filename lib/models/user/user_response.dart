import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  String message;
  int statusCode;
  DataResponse? data;

  UserResponse({
    this.data,
    required this.statusCode,
    required this.message,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class DataResponse {
  String? id;
  String? phone;
  String? memberId;
  PatientResponse? patient;

  DataResponse(
      {required this.id,
      required this.phone,
      required this.memberId,
      required this.patient});

  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}

@JsonSerializable()
class PatientResponse {
  String? id;
  String? fullName;
  String? gender;
  DateTime? dateOfBirth;
  String? address;
  String? avatar;
  String? job;
  String? insuranceNumber;
  String? state;
  String? medicalHistory;
  String? doctorId;

  PatientResponse(
      {required this.id,
      required this.fullName,
      required this.gender,
      required this.address,
      required this.avatar,
      required this.job,
      required this.insuranceNumber,
      required this.state,
      required this.medicalHistory,
      required this.doctorId,
      required this.dateOfBirth});

  factory PatientResponse.fromJson(Map<String, dynamic> json) =>
      _$PatientResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PatientResponseToJson(this);
}

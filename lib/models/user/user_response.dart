import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  String message;
  int statusCode;
  DataUserResponse? data;

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
class DataUserResponse {
  String? id;
  String? phone;
  String? memberId;
  PatientResponse? patient;

  DataUserResponse(
      {required this.id,
      required this.phone,
      required this.memberId,
      required this.patient});

  factory DataUserResponse.fromJson(Map<String, dynamic> json) =>
      _$DataUserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataUserResponseToJson(this);
}

@JsonSerializable()
class PatientResponse {
  String? id;
  String? fullName;
  String? gender;
  DateTime? dateOfBirth;
  String? address;
  String? phone;
  String? avatar;
  String? job;
  String? insuranceNumber;
  String? state;
  String? medicalHistory;
  String? doctorId;

  PatientResponse(
      {this.id,
      this.fullName,
      this.gender,
      this.address,
      this.avatar,
      this.job,
      this.phone,
      this.insuranceNumber,
      this.state,
      this.medicalHistory,
      this.doctorId,
      this.dateOfBirth});

  factory PatientResponse.fromJson(Map<String, dynamic> json) =>
      _$PatientResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PatientResponseToJson(this);
}

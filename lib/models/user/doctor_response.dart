import 'package:json_annotation/json_annotation.dart';

part 'doctor_response.g.dart';

@JsonSerializable()
class DoctorResponse {
  String message;
  int statusCode;
  DataDoctorResponse? data;

  DoctorResponse({
    this.data,
    required this.statusCode,
    required this.message,
  });

  factory DoctorResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorResponseToJson(this);
}

@JsonSerializable()
class DataDoctorResponse {
  String? id;
  String? fullName;
  String? gender;
  DateTime? dateOfBirth;
  String? address;
  String? phone;
  String? avatar;
  String? specialize;
  String? description;
  String? experience;
  String? workPlace;
  String? email;
  double? countPatient;
  double? rate;

  DataDoctorResponse(
      {this.id,
      this.fullName,
      this.gender,
      this.address,
      this.avatar,
      this.specialize,
      this.phone,
      this.description,
      this.experience,
      this.workPlace,
      this.rate,
      this.email,
      this.countPatient,
      this.dateOfBirth});

  factory DataDoctorResponse.fromJson(Map<String, dynamic> json) =>
      _$DataDoctorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataDoctorResponseToJson(this);
}
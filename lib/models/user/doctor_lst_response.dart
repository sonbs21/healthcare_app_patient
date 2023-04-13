import 'package:json_annotation/json_annotation.dart';

part 'doctor_lst_response.g.dart';

@JsonSerializable()
class DoctorLstResponse {
  String message;
  int statusCode;
  List<DataDoctorLstResponse> data;

  DoctorLstResponse({
    required this.data,
    required this.statusCode,
    required this.message,
  });

  factory DoctorLstResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorLstResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorLstResponseToJson(this);
}

@JsonSerializable()
class DataDoctorLstResponse {
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

  DataDoctorLstResponse(
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

  factory DataDoctorLstResponse.fromJson(Map<String, dynamic> json) =>
      _$DataDoctorLstResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataDoctorLstResponseToJson(this);
}

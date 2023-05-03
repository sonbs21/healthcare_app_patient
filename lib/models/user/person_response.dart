import 'package:json_annotation/json_annotation.dart';

part 'person_response.g.dart';

@JsonSerializable()
class PersonResponse {
  String message;
  int statusCode;
  DataPersonResponse? data;

  PersonResponse({
    this.data,
    required this.statusCode,
    required this.message,
  });

  factory PersonResponse.fromJson(Map<String, dynamic> json) =>
      _$PersonResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PersonResponseToJson(this);
}

@JsonSerializable()
class DataPersonResponse {
  String? id;
  String? phone;
  String? memberId;
  PersonDoctorResponse? doctor;

  DataPersonResponse(
      {required this.id,
      required this.phone,
      required this.memberId,
      required this.doctor});

  factory DataPersonResponse.fromJson(Map<String, dynamic> json) =>
      _$DataPersonResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataPersonResponseToJson(this);
}

@JsonSerializable()
class PersonDoctorResponse {
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

  PersonDoctorResponse(
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
      this.email,
      this.dateOfBirth});

  factory PersonDoctorResponse.fromJson(Map<String, dynamic> json) =>
      _$PersonDoctorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PersonDoctorResponseToJson(this);
}

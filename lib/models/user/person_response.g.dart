// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonResponse _$PersonResponseFromJson(Map<String, dynamic> json) =>
    PersonResponse(
      data: json['data'] == null
          ? null
          : DataPersonResponse.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as int,
      message: json['message'] as String,
    );

Map<String, dynamic> _$PersonResponseToJson(PersonResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
    };

DataPersonResponse _$DataPersonResponseFromJson(Map<String, dynamic> json) =>
    DataPersonResponse(
      id: json['id'] as String?,
      phone: json['phone'] as String?,
      memberId: json['memberId'] as String?,
      doctor: json['doctor'] == null
          ? null
          : PersonDoctorResponse.fromJson(
              json['doctor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataPersonResponseToJson(DataPersonResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'memberId': instance.memberId,
      'doctor': instance.doctor,
    };

PersonDoctorResponse _$PersonDoctorResponseFromJson(
        Map<String, dynamic> json) =>
    PersonDoctorResponse(
      id: json['id'] as String?,
      fullName: json['fullName'] as String?,
      gender: json['gender'] as String?,
      address: json['address'] as String?,
      avatar: json['avatar'] as String?,
      specialize: json['specialize'] as String?,
      phone: json['phone'] as String?,
      description: json['description'] as String?,
      experience: json['experience'] as String?,
      workPlace: json['workPlace'] as String?,
      email: json['email'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
    );

Map<String, dynamic> _$PersonDoctorResponseToJson(
        PersonDoctorResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'address': instance.address,
      'phone': instance.phone,
      'avatar': instance.avatar,
      'specialize': instance.specialize,
      'description': instance.description,
      'experience': instance.experience,
      'workPlace': instance.workPlace,
      'email': instance.email,
    };

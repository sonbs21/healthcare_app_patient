// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_lst_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorLstResponse _$DoctorLstResponseFromJson(Map<String, dynamic> json) =>
    DoctorLstResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => DataDoctorLstResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: json['statusCode'] as int,
      message: json['message'] as String,
    );

Map<String, dynamic> _$DoctorLstResponseToJson(DoctorLstResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
    };

DataDoctorLstResponse _$DataDoctorLstResponseFromJson(
        Map<String, dynamic> json) =>
    DataDoctorLstResponse(
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
      rate: (json['rate'] as num?)?.toDouble(),
      email: json['email'] as String?,
      countPatient: (json['countPatient'] as num?)?.toDouble(),
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
    );

Map<String, dynamic> _$DataDoctorLstResponseToJson(
        DataDoctorLstResponse instance) =>
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
      'countPatient': instance.countPatient,
      'rate': instance.rate,
    };

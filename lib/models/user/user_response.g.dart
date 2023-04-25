// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      data: json['data'] == null
          ? null
          : DataUserResponse.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as int,
      message: json['message'] as String,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
    };

DataUserResponse _$DataUserResponseFromJson(Map<String, dynamic> json) =>
    DataUserResponse(
      id: json['id'] as String?,
      phone: json['phone'] as String?,
      memberId: json['memberId'] as String?,
      patient: json['patient'] == null
          ? null
          : PatientResponse.fromJson(json['patient'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataUserResponseToJson(DataUserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'memberId': instance.memberId,
      'patient': instance.patient,
    };

PatientResponse _$PatientResponseFromJson(Map<String, dynamic> json) =>
    PatientResponse(
      id: json['id'] as String?,
      fullName: json['fullName'] as String?,
      gender: json['gender'] as String?,
      address: json['address'] as String?,
      avatar: json['avatar'] as String?,
      job: json['job'] as String?,
      phone: json['phone'] as String?,
      insuranceNumber: json['insuranceNumber'] as String?,
      state: json['state'] as String?,
      medicalHistory: json['medicalHistory'] as String?,
      doctorId: json['doctorId'] as String?,
      carer: (json['carer'] as List<dynamic>)
          .map((e) => CarerResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
    );

Map<String, dynamic> _$PatientResponseToJson(PatientResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'address': instance.address,
      'phone': instance.phone,
      'avatar': instance.avatar,
      'job': instance.job,
      'insuranceNumber': instance.insuranceNumber,
      'state': instance.state,
      'medicalHistory': instance.medicalHistory,
      'doctorId': instance.doctorId,
      'carer': instance.carer,
    };

CarerResponse _$CarerResponseFromJson(Map<String, dynamic> json) =>
    CarerResponse(
      id: json['id'] as String?,
      fullName: json['fullName'] as String?,
      patientId: json['patientId'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$CarerResponseToJson(CarerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'phone': instance.phone,
      'patientId': instance.patientId,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRequest _$UserRequestFromJson(Map<String, dynamic> json) => UserRequest(
      fullName: json['fullName'] as String?,
      address: json['address'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      gender: json['gender'] as String?,
      job: json['job'] as String?,
      fullNameCarer: json['fullNameCarer'] as String?,
      phoneCarer: json['phoneCarer'] as String?,
    );

Map<String, dynamic> _$UserRequestToJson(UserRequest instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'address': instance.address,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'gender': instance.gender,
      'job': instance.job,
      'fullNameCarer': instance.fullNameCarer,
      'phoneCarer': instance.phoneCarer,
    };

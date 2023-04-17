// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_time_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentTimeResponse _$AppointmentTimeResponseFromJson(
        Map<String, dynamic> json) =>
    AppointmentTimeResponse(
      data: (json['data'] as List<dynamic>).map((e) => e as String).toList(),
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AppointmentTimeResponseToJson(
        AppointmentTimeResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
    };

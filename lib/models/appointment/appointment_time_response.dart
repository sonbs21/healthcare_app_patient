import 'package:json_annotation/json_annotation.dart';

part 'appointment_time_response.g.dart';

@JsonSerializable()
class AppointmentTimeResponse {
  String? message;
  int? statusCode;
  List<String> data;
  // DataResponse[] data;

  AppointmentTimeResponse({
    required this.data,
    this.statusCode,
    this.message,
  });

  factory AppointmentTimeResponse.fromJson(Map<String, dynamic> json) =>
      _$AppointmentTimeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentTimeResponseToJson(this);
}


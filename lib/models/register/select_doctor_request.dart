import 'package:json_annotation/json_annotation.dart';
part 'select_doctor_request.g.dart';

@JsonSerializable()
class SelectDoctorRequest {
  String? doctorId;

  SelectDoctorRequest({
    this.doctorId,
  });

  factory SelectDoctorRequest.fromJson(Map<String, dynamic> json) =>
      _$SelectDoctorRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SelectDoctorRequestToJson(this);
}
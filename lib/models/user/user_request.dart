import 'package:json_annotation/json_annotation.dart';
part 'user_request.g.dart';

@JsonSerializable()
class UserRequest {
  String? fullName;
  String? address;
  DateTime? dateOfBirth;
  String? gender;
  String? job;
  String? fullNameCarer;
  String? phoneCarer;

  UserRequest({
    this.fullName,
    this.address,
    this.dateOfBirth,
    this.gender,
    this.job,
    this.fullNameCarer,
    this.phoneCarer,
  });

  factory UserRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UserRequestToJson(this);
}

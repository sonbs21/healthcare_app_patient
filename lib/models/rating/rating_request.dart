import 'package:json_annotation/json_annotation.dart';
part 'rating_request.g.dart';



@JsonSerializable()
class RatingRequest {
  String? doctorId;
  String? rating;


  RatingRequest({
    required this.doctorId,
    required this.rating,

  });

  factory RatingRequest.fromJson(Map<String, dynamic> json) =>
      _$RatingRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RatingRequestToJson(this);
}




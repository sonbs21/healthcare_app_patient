import 'package:json_annotation/json_annotation.dart';

part 'chat_ai_request.g.dart';

@JsonSerializable()
class ChatAiRequest {
  String? question;

  ChatAiRequest({
    this.question,
  });

  factory ChatAiRequest.fromJson(Map<String, dynamic> json) =>
      _$ChatAiRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ChatAiRequestToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'chat_ai_response.g.dart';

@JsonSerializable()
class ChatAiResponse {
  String? text;
  int? index;

  ChatAiResponse({
    this.text,
    this.index,
  });

  factory ChatAiResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatAiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ChatAiResponseToJson(this);
}

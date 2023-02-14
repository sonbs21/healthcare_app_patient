class BaseResponse {
  String message;
  int statusCode;


  BaseResponse({
    required this.statusCode,
    required this.message,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);

  @override
  String toString() {
    return 'BaseResponse(message: $message, statusCode: $statusCode)';
  }
}



BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse(
      statusCode: json['statusCode'] as int,
      message: json['message'] as String,
    );

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
    };


import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:healthcare_mobile/api/rest_api.dart';
import 'package:healthcare_mobile/models/chats/chat_response.dart';
import 'package:healthcare_mobile/models/chats/conversation_response.dart';
import 'package:healthcare_mobile/models/chats/message_request.dart';
import 'package:healthcare_mobile/models/chats/message_response.dart';
import 'package:healthcare_mobile/models/chats/upload_response.dart';
import 'package:healthcare_mobile/service/local_storage_service.dart';
import 'package:image_picker/image_picker.dart';

class ChatRepository {
  final dio = Dio(); // Provide a dio instance

  Future<ConversationResponse> getAllConversation(
    int? page,
    int? pageSize,
  ) async {
    final queryParams = {
      'page': page ?? 1,
      'pageSize': pageSize ?? 20,
    };

    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.get(
      'http://10.0.2.2:5000/v1/conversation',
      queryParameters: queryParams,
    );

    return ConversationResponse.fromJson(response.data);
  }

  Future<ChatResponse> getMessage(
    String id,
    int? page,
    int? pageSize,
  ) async {
    final queryParams = {
      'page': page ?? 1,
      'pageSize': pageSize ?? 10,
    };
    // if (status != null) {
    //   queryParams['status'] = status;
    // }
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.get(
      'http://10.0.2.2:5000/v1/chat/$id',
      queryParameters: queryParams,
    );

    return ChatResponse.fromJson(response.data);
  }

  Future<MessageResponse> postMessage(String id, MessageRequest dto) async {
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.post('http://10.0.2.2:5000/v1/chat/$id', data: {
      "content": dto.content,
      "file": dto.file,
      "typeMessage": dto.typeMessage,
    });

    return MessageResponse.fromJson(response.data);
  }

  Future<List<dynamic>> upload(List<XFile> files) async {
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    FormData formData = FormData();

    for (int i = 0; i < files.length; i++) {
      formData.files.addAll([
        MapEntry(
          "files",
          await MultipartFile.fromFile(
            files[i].path,
            filename: files[i].path.split("/").last,
          ),
        ),
      ]);
    }

    Response<dynamic> response =
        await dio.post('http://10.0.2.2:5000/v1/upload', data: formData);
    List<UploadResponse> lst = (response.data as List<dynamic>)
        .map((e) => UploadResponse.fromJson(e))
        .toList();
    return lst;
  }

  Future<List<dynamic>> uploadFile(List<FilePickerResult> files) async {
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    FormData formData = FormData();

    for (int i = 0; i < files.length; i++) {
      String filename = files[i].files[0].path!.split("/").last;
      formData.files.add(MapEntry(
        "files",
        await MultipartFile.fromFile(
          files[i].files[0].path!,
          filename: filename,
        ),
      ));
    }
    Response<dynamic> response =
        await dio.post('http://10.0.2.2:5000/v1/upload', data: formData);
    List<UploadResponse> lst = (response.data as List<dynamic>)
        .map((e) => UploadResponse.fromJson(e))
        .toList();
    return lst;
  }
}

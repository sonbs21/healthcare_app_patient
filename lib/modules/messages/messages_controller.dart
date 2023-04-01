import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/models/chats/chat_response.dart';
import 'package:healthcare_mobile/models/chats/message_request.dart';
import 'package:healthcare_mobile/repository/chat.repository.dart';
import 'package:healthcare_mobile/service/socket_service.dart';
import 'package:socket_io_client/socket_io_client.dart';

class MessagesController extends GetxController {
  var chatRepository = Get.find<ChatRepository>();
  var contentController = TextEditingController();
  RxList<DataMessageResponse> listMessage = RxList<DataMessageResponse>([]);
  var socketService = Get.find<SocketService>();

  // @override
  @override
  void onInit() {
    super.onInit();
    socketService.socket.onConnect((data) {
      print('Connected to Socket.io server');
      socketService.socket.on('newMessage', (msg) {
        // MessageResponse msga = msg;
        // print('Received message data: ${data['data']}');
        try {
          DataMessageResponse messageResponse =
              DataMessageResponse.fromJson(msg['data']);

          listMessage.add(messageResponse);
        } catch (e) {
          print('errr: ${e}');
        }
      });
    });
  }

  @override
  void onClose() {
    socketService.socket.off('newMessage');
    super.onClose();
  }
  // @override
  // void onInit() {
  //   super.onInit();

  //   // subscribe to the 'message' event from Socket.io server
  //   socketService.socket.on('newMessage', (data) {
  //     print('Received message: $data');
  //   });
  // }

  void initListMessage(String id) async {
    final response = await chatRepository.getMessage(id, 1, 100);

    if (response.statusCode == 200) {
      // listBmi = response.data;
      listMessage.clear();

      listMessage.addAll(response.data);
      // onComplete();
    } else {
      // Xử lý khi API trả về lỗi
    }
  }

  void postMessage(String id, String content) async {
    // final client = RestClient(dio);

    try {
      await chatRepository
          .postMessage(id,
              MessageRequest(typeMessage: 'TEXT', content: content, file: []))
          .then((value) {});
    } on DioError catch (e) {
      EasyLoading.showError(e.response?.data['message']);
    }
  }
}

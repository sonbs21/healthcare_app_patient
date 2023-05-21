import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/models/chats/chat_ai_request.dart';
import 'package:healthcare_mobile/repository/chat.repository.dart';

class GptController extends GetxController {
  var chatRepository = Get.find<ChatRepository>();
  RxList<Message> lstMessageAi = RxList<Message>([]);
  RxBool isLoading = false.obs;
  var textEditingController = TextEditingController();

  void chatAiMessage(String dto) async {
    isLoading.value = true;
    lstMessageAi.add(Message(dto, 1));

    await chatRepository
        .chatAiMessage(ChatAiRequest(question: dto))
        .then((value) => {
              isLoading.value = false,
              textEditingController.text = "",
              lstMessageAi.add(Message(value.text ?? "", value.index ?? 0))
            });
  }
}

class Message {
  Message(this.msg, this.index);
  final String? msg;
  final int index;
}

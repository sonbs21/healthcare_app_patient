import 'package:flutter/cupertino.dart';
import 'package:healthcare_mobile/api/api_service.dart';
import 'package:healthcare_mobile/models/chats/ChatGPT.dart';

class ChatProvider with ChangeNotifier {
  List<ChatModel> chatList = [];
  List<ChatModel> get getchatList => chatList;

  void addUserMessage({required String msg}) {
    print("msg1:${msg}");

    chatList.add(ChatModel(msg: msg, chatIndex: 0));
    notifyListeners();
  }

  Future<void> botMessage(
      {required String msg, required String modelID}) async {
    print("msg2:${msg}");
    print("modelID:${modelID}");
    chatList.addAll(await ApiServices.sendMessage(
      msg: msg,
      modelId: modelID,
    ));
    notifyListeners();
  }
}

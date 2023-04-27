import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:healthcare_mobile/modules/chat/gpt/models/chat_model.dart';
import 'package:healthcare_mobile/modules/chat/gpt/models/models_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<ModelsModel>> getModels() async {
    String BASE_URL = "https://api.openai.com/v1";
    String API_KEY = "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";
    try {
      var response = await http.get(
        Uri.parse("$BASE_URL/models"),
        headers: {'Authorization': 'Bearer $API_KEY'},
      );

      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']["message"]);
      }
      List temp = [];
      for (var value in jsonResponse["data"]) {
        temp.add(value);
      }
      return ModelsModel.modelsFromSnapshot(temp);
    } catch (error) {
      log("error $error");
      rethrow;
    }
  }

  // Send Message fct
  static Future<List<ChatModel>> sendMessage(
      {required String message, required String modelId}) async {
    String BASE_URL = "https://api.openai.com/v1";
    String API_KEY = "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";
    try {
      log("modelId $modelId");
      log("message $message");
      var response = await http.post(
        Uri.parse("$BASE_URL/completions"),
        headers: {
          'Authorization': 'Bearer $API_KEY',
          'Content-Type': 'application/json; charset=utf-8',
        },
        body: jsonEncode(
          {
            'model': modelId,
            'prompt': message,
            'max_tokens': 300,
          },
        ),
      );

      Map jsonResponse = jsonDecode(response.body);
      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']["message"]);
      }
      List<ChatModel> chatList = [];
      if (jsonResponse["choices"].length > 0) {

        chatList = List.generate(
          jsonResponse["choices"].length,
          (index) => ChatModel(
            msg: utf8
                .decode(jsonResponse["choices"][index]["text"].runes.toList()),
            chatIndex: 1,
          ),
        );
      }
      return chatList;
    } catch (error) {
      rethrow;
    }
  }
}

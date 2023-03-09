import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:healthcare_mobile/models/chats/ChatGPT.dart';
import 'package:healthcare_mobile/models/chats/OpenApiModel.dart';
import 'package:http/http.dart' as http;

const String _BASE_URL = "https://api.openai.com/v1";
const String _Api_key = "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";

class ApiServices {
  static Future<List<OpenApiModel>> getModel() async {
    try {
      var response = await http.get(
        Uri.parse("$_BASE_URL/models"),
        headers: {
          "Content-Type": "application/json; charset=utf-8",
          "Authorization": "Bearer $_Api_key"
        },
      );
      print("response.body:${response.body}");
      Map jsonResponse = jsonDecode(response.body);
      if (jsonResponse["error"] != null) {
        throw HttpException(jsonResponse["error"]["message"]);
      }
      List temp = [];
      for (var value in jsonResponse["data"]) {
        print("value: ${value}");
        temp.add(value);
      }
      print("temp:${temp}");
      return OpenApiModel.modelsFromSnapshot(temp);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<List<ChatModel>> sendMessage(
      {required String msg, required String modelId}) async {
    try {
      // final encodedText = utf8.encode(msg);
      print('encodedTextmsg: ${msg}');
      print('encodedTextmodelId: ${modelId}');
      if (modelId != 0) {
        final encodedText = utf8.encode(msg);
        print('encodedText: ${encodedText}');
      }

      var response = await http.post(Uri.parse("$_BASE_URL/completions"),
          headers: {
            "Content-Type": "application/json; charset=utf-8",
            // "Content-Type": "application/json",
            "Authorization": "Bearer $_Api_key"
          },
          body:
              jsonEncode({"model": modelId, "prompt": msg, "max_tokens": 100}));

      Map jsonResponse = jsonDecode(response.body);
      if (jsonResponse["error"] != null) {
        throw HttpException(jsonResponse["error"]["message"]);
      }
      List<ChatModel> chatList = [];
      if (jsonResponse["choices"].length > 0) {
        //log("Message: ${jsonResponse["choices"][0]["text"]}");
        chatList = List.generate(
          jsonResponse["choices"].length,
          (index) => ChatModel(
            msg: jsonResponse["choices"][index]["text"],
            chatIndex: 1,
          ),
        );
      }
      return chatList;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}

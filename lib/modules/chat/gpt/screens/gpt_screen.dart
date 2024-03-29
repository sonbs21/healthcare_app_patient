import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/chat/gpt/providers/chats_provider.dart';
import 'package:healthcare_mobile/modules/chat/gpt/screens/gpt_controller.dart';
import 'package:healthcare_mobile/modules/chat/gpt/services/services.dart';
import 'package:healthcare_mobile/modules/chat/gpt/widgets/chat_widget.dart';
import 'package:provider/provider.dart';

import '../providers/models_provider.dart';
import '../services/assets_manager.dart';
import '../widgets/text_widget.dart';

class GptScreen extends StatefulWidget {
  const GptScreen({super.key});

  @override
  State<GptScreen> createState() => _GptScreenState();
}

class _GptScreenState extends State<GptScreen> {
  bool _isTyping = false;
  var gptController = Get.find<GptController>();

  late TextEditingController textEditingController;
  late ScrollController _listScrollController;
  late FocusNode focusNode;
  @override
  void initState() {
    _listScrollController = ScrollController();
    textEditingController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _listScrollController.dispose();
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  // List<ChatModel> chatList = [];
  @override
  Widget build(BuildContext context) {
    // final modelsProvider = Provider.of<ModelsProvider>(context);
    // final chatProvider = Provider.of<ChatProvider>(context);
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 2,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AssetsManager.openaiLogo),
          ),
          title: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Chat bot AI",
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                await Services.showModalSheet(context: context);
              },
              icon: const Icon(Icons.more_vert_rounded, color: Colors.white),
            ),
          ],
        ),
        body: SafeArea(
          child: Obx(
            () => Column(
              children: [
                Flexible(
                  child: ListView.builder(
                      controller: _listScrollController,
                      itemCount:
                          gptController.lstMessageAi.length, //chatList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ChatWidget(
                                msg: gptController.lstMessageAi[index].msg ??
                                    "", // chatList[index].msg,
                                chatIndex:
                                    gptController.lstMessageAi[index].index),
                            gptController.isLoading.isTrue
                                ? const ChatWidget(
                                    msg: "Đang trả lời", // chatList[index].msg,
                                    chatIndex: 0)
                                : const SizedBox(),
                          ],
                        );
                      }),
                ),
                if (_isTyping) ...[
                  const SpinKitThreeBounce(
                    color: Colors.white,
                    size: 18,
                  ),
                ],
                const SizedBox(
                  height: 15,
                ),
                Material(
                  color: const Color(0xFF444654),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            focusNode: focusNode,
                            style: const TextStyle(color: Colors.white),
                            controller: gptController.textEditingController,
                            onSubmitted: (value) async {
                              gptController.chatAiMessage(
                                  gptController.textEditingController.text);
                            },
                            decoration: const InputDecoration.collapsed(
                                hintText: "Nhập tin nhắn",
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                        ),
                        IconButton(
                            onPressed: () async {
                              gptController.chatAiMessage(
                                  gptController.textEditingController.text);
                              // await sendMessageFCT(
                              //     modelsProvider: modelsProvider,
                              //     chatProvider: chatProvider);
                            },
                            icon: const Icon(
                              Icons.send,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void scrollListToEND() {
    _listScrollController.animateTo(
        _listScrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 2),
        curve: Curves.easeOut);
  }

  Future<void> sendMessageFCT(
      {required ModelsProvider modelsProvider,
      required ChatProvider chatProvider}) async {
    if (_isTyping) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: TextWidget(
            label: "You cant send multiple messages at a time",
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    if (textEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: TextWidget(
            label: "Please type a message",
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    try {
      String msg = textEditingController.text;
      setState(() {
        _isTyping = true;
        // chatList.add(ChatModel(msg: textEditingController.text, chatIndex: 0));
        chatProvider.addUserMessage(msg: msg);
        textEditingController.clear();
        focusNode.unfocus();
      });
      await chatProvider.sendMessageAndGetAnswers(
          msg: msg, chosenModelId: modelsProvider.getCurrentModel);
      // chatList.addAll(await ApiService.sendMessage(
      //   message: textEditingController.text,
      //   modelId: modelsProvider.getCurrentModel,
      // ));
      setState(() {});
    } catch (error) {
      log("error $error");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: TextWidget(
          label: error.toString(),
        ),
        backgroundColor: Colors.red,
      ));
    } finally {
      setState(() {
        scrollListToEND();
        _isTyping = false;
      });
    }
  }
}

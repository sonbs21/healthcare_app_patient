import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:healthcare_mobile/api/services.dart';
import 'package:healthcare_mobile/modules/chat_gpt/provider/chat_provider.dart';
import 'package:healthcare_mobile/modules/chat_gpt/provider/model_provider.dart';
import 'package:healthcare_mobile/modules/chat_gpt/widget/chat_widget.dart';
import 'package:healthcare_mobile/modules/chat_gpt/widget/custom_text_widget.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import './provider/model_provider.dart';

class ChatGPTScreen extends StatefulWidget {
  const ChatGPTScreen({super.key});

  @override
  State<ChatGPTScreen> createState() => _ChatGPTScreenState();
}

class _ChatGPTScreenState extends State<ChatGPTScreen> {
  bool _isTyping = false;

  late TextEditingController _textEditingController;
  late ScrollController scrollController;

  late FocusNode focusNode;
  @override
  void initState() {
    _textEditingController = TextEditingController();
    focusNode = FocusNode();
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    focusNode.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ModelProvider>(context, listen: false);
    final chatProvider = Provider.of<ChatProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("ChatGPT"),
        actions: [
          IconButton(
              onPressed: () async {
                await Services.showBottomSheet(context: context);
              },
              icon: const Icon(
                Icons.more_vert_rounded,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: chatProvider.getchatList.length,
              controller: scrollController,
              itemBuilder: (context, index) {
                return ChatWidget(
                  msg: chatProvider.getchatList[index].msg,
                  index: chatProvider.getchatList[index].chatIndex,
                );
              },
            ),
          ),
          if (_isTyping) ...[
            const SpinKitThreeBounce(
              color: Colors.white,
              size: 18,
            ),
          ],
          const SizedBox(height: 15),
          Container(
            color: const Color(0xff444654),
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    focusNode: focusNode,
                    controller: _textEditingController,
                    style: const TextStyle(color: Colors.white),
                    onSubmitted: (value) async {
                      await sendMessages(
                          provider: provider, chatProvider: chatProvider);
                    },
                    decoration: const InputDecoration.collapsed(
                        hintText: "How can i help you",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      sendMessages(
                          provider: provider, chatProvider: chatProvider);
                    },
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  void scrollToEnd() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 2),
      curve: Curves.easeOut,
    );
  }

  Future<void> sendMessages({
    required ModelProvider provider,
    required ChatProvider chatProvider,
  }) async {

    print('provider ${provider}');
    print('chatProvider ${chatProvider}');

    if (_isTyping) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: CustomTextWidget(
            label: "You can't send multiple messages.",
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    if (_textEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: CustomTextWidget(
            label: "Please type a message",
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    try {
      String sendMsg = _textEditingController.text;
      print("object: ${sendMsg}");
      setState(() {
        _isTyping = true;
        chatProvider.addUserMessage(msg: sendMsg);
        _textEditingController.clear();
        focusNode.unfocus();
      });
      await chatProvider.botMessage(
        msg: sendMsg,
        modelID: provider.currentModel,
      );
      setState(() {});
    } catch (e) {
      log("error is: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: CustomTextWidget(
          label: e.toString(),
        ),
        backgroundColor: Colors.red,
      ));
    } finally {
      setState(() {
        scrollToEnd();
        _isTyping = false;
      });
    }
  }
}

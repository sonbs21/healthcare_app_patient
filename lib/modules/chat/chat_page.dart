import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/components/filled_outline_button.dart';
import 'package:healthcare_mobile/models/chats/Chat.dart';
import 'package:healthcare_mobile/models/chats/chat_response.dart';
import 'package:healthcare_mobile/modules/chat/chat_controller.dart';
import 'package:healthcare_mobile/modules/messages/messages_controller.dart';
import 'package:healthcare_mobile/modules/messages/messages_page.dart';
import 'package:healthcare_mobile/routes/app_routes.dart';
import 'package:healthcare_mobile/service/local_storage_service.dart';
import 'package:healthcare_mobile/utils/constant.dart';

import 'chat_card.dart';

class ChatPage extends StatelessWidget {
  var chatController = Get.find<ChatController>();
  var messagesController = Get.find<MessagesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
        // actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        title: const Text('Nhắn tin'),
        centerTitle: true,
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.fromLTRB(
              kDefaultPadding, 0, kDefaultPadding, kDefaultPadding * 0.75),
          color: kPrimaryColor,
          child: Row(
            children: [
              FillOutlineButton(press: () {}, text: 'Message'),
              const SizedBox(width: kDefaultPadding),
              FillOutlineButton(
                press: () {
                  Get.toNamed(AppRoutes.CHAT_GPT_PAGE);
                },
                text: 'Chat AI',
                isFilled: false,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: chatController.listConversation.length,
            itemBuilder: ((context, index) => ChatCard(
                chat: chatController.listConversation[index],
                press: () => {
                      LocalStorageService.setConversationId(
                          chatController.listConversation[index].id as String),
                      messagesController.initListMessage(
                          chatController.listConversation[index].id ?? '', () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MessagesPage(
                                  chat:
                                      chatController.listConversation[index])),
                        );
                      })
                    })),
          ),
        )
      ]),
    );
  }
}

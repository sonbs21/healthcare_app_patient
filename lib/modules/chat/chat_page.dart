import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/chat/chat_controller.dart';
import 'package:healthcare_mobile/modules/chat/gpt/screens/gpt_screen.dart';
import 'package:healthcare_mobile/modules/messages/messages_controller.dart';
import 'package:healthcare_mobile/modules/messages/messages_page.dart';
import 'package:healthcare_mobile/routes/app_routes.dart';
import 'package:healthcare_mobile/service/local_storage_service.dart';

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
        title: const Text('Hội thoại'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.CHAT_GPT_PAGE);
        },
        child: const Icon(Icons.chat),
      ),
      body: Column(children: [
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
                      }),

                      //      () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => MessagesPage(
                      //             chat:
                      //                 chatController.listConversation[index])),
                      //   );
                      // })
                    })),
          ),
        )
      ]),
    );
  }
}

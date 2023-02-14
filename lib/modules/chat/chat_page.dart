import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/components/filled_outline_button.dart';
import 'package:healthcare_mobile/models/chats/Chat.dart';
import 'package:healthcare_mobile/modules/messages/messages_page.dart';
import 'package:healthcare_mobile/routes/app_routes.dart';
import 'package:healthcare_mobile/utils/constant.dart';

import 'chat_card.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        title: const Text('Nhắn tin'),
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
                  Get.offNamed(AppRoutes.CHAT_GPT_PAGE);
                },
                text: 'Chat AI',
                isFilled: false,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: ((context, index) => ChatCard(
                  chat: chatsData[index],
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MessagesPage())),
                )),
          ),
        )
      ]),
    );
  }
}

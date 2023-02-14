import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthcare_mobile/models/chats/ChatMessage.dart';
import 'package:healthcare_mobile/modules/messages/components/chat_input_fields.dart';
import 'package:healthcare_mobile/modules/messages/components/message.dart';
import 'package:healthcare_mobile/utils/constant.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ListView.builder(
              itemCount: demeChatMessages.length,
              itemBuilder: (context, index) =>
                  Message(message: demeChatMessages[index]),
            ),
          )),
          ChatInputField()
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const BackButton(),
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/user_2.png'),
          ),
          const SizedBox(width: kDefaultPadding * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Kristin Watson', style: TextStyle(fontSize: 16)),
              Text('Active 3m ago', style: TextStyle(fontSize: 12))
            ],
          )
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.call)),
        IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
        SizedBox(
          width: kDefaultPadding / 2,
        )
      ],
    );
  }
}

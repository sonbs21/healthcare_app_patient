import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/models/chats/ChatMessage.dart';
import 'package:healthcare_mobile/models/chats/conversation_response.dart';
import 'package:healthcare_mobile/modules/messages/components/chat_input_fields.dart';
import 'package:healthcare_mobile/modules/messages/components/message.dart';
import 'package:healthcare_mobile/modules/messages/messages_controller.dart';
import 'package:healthcare_mobile/utils/constant.dart';

class MessagesPage extends StatelessWidget {
  MessagesPage({
    Key? key,
    required this.chat,
  }) : super(key: key);

  var messagesController = Get.find<MessagesController>();
  DataConversationResponse? chat;

  // @override
  Widget build(BuildContext context) {
    var t = print('***${messagesController.listMessage.length}****');
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ListView.builder(
                  controller: messagesController.scrollController,
                  itemCount: messagesController.listMessage.length,
                  itemBuilder: (context, index) =>
                      Message(message: messagesController.listMessage[index]),
                ))),
          ),
          const ChatInputField()
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    var user = chat?.member.firstWhere((m) => m.user?.id != id)?.user;
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const BackButton(),
          const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://thumbs.dreamstime.com/b/male-avatar-icon-flat-style-male-user-icon-cartoon-man-avatar-hipster-vector-stock-91462914.jpg"),
          ),
          const SizedBox(width: kDefaultPadding * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user?.fullName ?? '', style: TextStyle(fontSize: 16)),
              // Text('Active 3m ago', style: TextStyle(fontSize: 12))
            ],
          )
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
        const SizedBox(
          width: kDefaultPadding / 2,
        )
      ],
    );
  }
}

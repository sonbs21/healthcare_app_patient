import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_mobile/modules/messages/messages_controller.dart';
import 'package:healthcare_mobile/service/local_storage_service.dart';
import 'package:healthcare_mobile/utils/constant.dart';

class ChatInputField extends StatefulWidget {
  const ChatInputField({Key? key}) : super(key: key);
  @override
  _ChatInputField createState() => _ChatInputField();
}

var messagesController = Get.find<MessagesController>();
var id = LocalStorageService.getConversationId();

class _ChatInputField extends State<ChatInputField> {
  bool isChange = false;

  @override
  void initState() {
    super.initState();
    messagesController.contentController.addListener(_handleTextFieldChanged);
  }

  @override
  void dispose() {
    messagesController.contentController
        .removeListener(_handleTextFieldChanged);
    super.dispose();
  }

  void _handleTextFieldChanged() {
    final text = messagesController.contentController.text;
    setState(() {
      isChange = text.isEmpty ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
                blurRadius: 32,
                offset: Offset(0, 4),
                color: Color(0xff087949).withOpacity(0.3))
          ]),
      child: SafeArea(
          child: Row(
        children: [
          Icon(Icons.mic, color: kPrimaryColor),
          SizedBox(width: kDefaultPadding),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.75),
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.07),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.sentiment_satisfied_alt_outlined,
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.color
                        ?.withOpacity(0.64),
                  ),
                  SizedBox(width: kDefaultPadding / 2),
                  Expanded(
                    child: TextField(
                      controller: messagesController.contentController,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Type Message'),
                    ),
                  ),
                  !isChange
                      ? Row(
                          children: [
                            Icon(
                              Icons.attach_file,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.color
                                  ?.withOpacity(0.64),
                            ),
                            SizedBox(width: kDefaultPadding / 4),
                            Icon(
                              Icons.camera_alt_outlined,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.color
                                  ?.withOpacity(0.64),
                            ),
                          ],
                        )
                      : GestureDetector(
                          onTap: () {
                            String content =
                                messagesController.contentController.text;

                            messagesController.postMessage(id, content);
                            messagesController.contentController.text = '';
                          },
                          child: Icon(
                            Icons.send,
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.color
                                ?.withOpacity(0.64),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

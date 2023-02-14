import 'package:flutter/material.dart';
import 'package:healthcare_mobile/modules/chat_gpt/chat_gpt_screen.dart';


void main() {
  runApp(const ChatGPTMain());
}

class ChatGPTMain extends StatelessWidget {
  const ChatGPTMain({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatGPT APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: const ChatGptScreen(),
    );
  }
}

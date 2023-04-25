import 'package:flutter/material.dart';
import '/widgets/chat_bubble.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Chat'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, i) => ChatBubble(message: 'hello iam abosamra'),
        itemCount: 15,
      ),
    );
  }
}

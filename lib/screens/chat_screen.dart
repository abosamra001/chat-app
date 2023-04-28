import 'package:chat_app/Models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/widgets/chat_bubble.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  var messageController = TextEditingController();
  var scrollController = ScrollController();
  var userId;
  CollectionReference chat = FirebaseFirestore.instance.collection('chat');

  Future<void> addMessage() {
    return chat.add(
      {
        'message': messageController.text,
        'createdAt': DateTime.now(),
        'id': userId as String,
      },
    );
  }

  void scrollDown() {
    messageController.clear();
    scrollController.jumpTo(
      scrollController.position.minScrollExtent,
    );
  }

  @override
  Widget build(BuildContext context) {
    userId = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: chat.orderBy('createdAt', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> messagesList = [];

          for (var i in snapshot.data!.docs) {
            messagesList.add(MessageModel.fromJson(i));
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text('Chat'),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: scrollController,
                    itemBuilder: (context, i) {
                      return messagesList[i].id == userId
                          ? SendChatBubble(message: messagesList[i].text)
                          : ReceiveChatBubble(message: messagesList[i].text);
                    },
                    itemCount: messagesList.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: messageController,
                    onSubmitted: (value) {
                      addMessage();
                      scrollDown();
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[300],
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 1),
                      ),
                      hintText: 'Type a message',
                      contentPadding: const EdgeInsets.all(15),
                      suffixIcon: IconButton(
                        onPressed: () {
                          addMessage();
                          scrollDown();
                        },
                        icon: const Icon(Icons.send),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

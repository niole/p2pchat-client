import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import './models/chats.dart';

class ChatMessagesView extends StatefulWidget {
  const ChatMessagesView({super.key});

  @override
  State<ChatMessagesView> createState() => _ChatMessagesView();
}

class _ChatMessagesView extends State<ChatMessagesView>{
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext ctx) {
    final selectedChat = Provider.of<Chats>(ctx).getInteractiveChat();

    if (selectedChat == null) {
      return Center(child: Text("No chat selected."));
    }
    return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(child: Text("users: ${selectedChat.usernames.join(",")}")),
            Expanded(
                 child: ListView.builder(
                     itemCount: selectedChat.messages.length, // TODO someday there will be too many messages
                     // and the length will not reflect the message count
                     itemBuilder: (BuildContext ctx, int index) {
                       return ListTile(
                           title: Container(
                               child: Text(selectedChat.messages[index].content)
                           )
                       );
              }
            )),
            TextFormField(
              controller: myController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            ElevatedButton(
              style:  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
              onPressed: () {
                print(myController.text);
              },
              child: const Text('Enter'),
            )

      ],
    );
  }

}
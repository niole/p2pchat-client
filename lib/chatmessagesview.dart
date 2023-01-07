import 'package:flutter/cupertino.dart';
import './common/createid.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import './models/chats.dart';
import './models/chat.dart';
import './models/user.dart';

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
                final chatsProvider = Provider.of<Chats>(ctx, listen: false);
                final oldChats = chatsProvider.chats;
                final indexOfChat = oldChats.indexOf(selectedChat);
                if (indexOfChat > -1) {
                  // Update in memory chat in order to show the message to the user
                  // then send the message to the other users in the chat
                  final user = Provider.of<User>(ctx, listen: false).user;
                  if (user != null) {
                    selectedChat.addMessages(
                        <Message>[
                          Message(
                              CreateId.id,
                              user,
                              selectedChat.id,
                              myController.text
                          )
                        ]);
                    oldChats[indexOfChat] = selectedChat;
                    chatsProvider.chats = oldChats;
                    myController.text = "";
                  } else {
                    throw Exception("A user was expected to be logged in but user was null");
                  }
                } else {
                  print("Chat ${selectedChat.id} was not findable in the chats state");
                }
              },
              child: const Text('Enter'),
            )
      ],
    );
  }
}
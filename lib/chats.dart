import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p2pchat/createeditchat.dart';
import './chatsoverviewlist.dart';
import './chatmessagesview.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext ctx) {

    return Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          child: const ChatsOverviewList(),
        ),
        body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CreateEditChat(),
              Expanded(child:
                    ChatMessagesView()
              )])
    );
  }
}
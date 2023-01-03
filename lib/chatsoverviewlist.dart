import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './models/chats.dart';
import './models/chat.dart';

class ChatsOverviewList extends StatelessWidget {
  const ChatsOverviewList({super.key});

  void selectChat(BuildContext ctx, Chat? chat) {
    final state = Provider.of<Chats>(ctx, listen: false);
    final currChat = state.getInteractiveChat();
    if (chat == currChat) {
      state.setInteractiveChat(null);
    } else {
      state.setInteractiveChat(chat);
    }
  }

  @override
  Widget build(BuildContext ctx) {
    final chats = Provider.of<Chats>(ctx, listen: true).chats;
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: chats.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          child: Center(
              child: ListTile(
                  title: Text(chats[index].usernames.join(",")),
                  onTap: () {
                    selectChat(context, chats[index]);
                    Navigator.of(ctx).pop();
                  }
              )
          ),
        );
      }
    );
  }
}
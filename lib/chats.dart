import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p2pchat/createeditchat.dart';
import 'package:provider/provider.dart';
import './models/chats.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext ctx) {
    final chats = Provider.of<Chats>(ctx, listen: true).chats;
    return Scaffold(
        body: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                  children: [
                    const CreateEditChat(),
                    Expanded(
                        child: Container(
                            margin: const EdgeInsets.only(bottom: 8.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent)
                            ),
                            width: 100,
                            child: ListView.separated(
                                itemCount: chats.length,
                                separatorBuilder: (BuildContext context, int index) => const Divider(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    height: 50,
                                    width: 100,
                                    child: Center(
                                        child: ListTile(title: Text(chats[index].usernames.join(",")))
                                    ),
                                  );
                                }
                            )
                        )
                    )
                  ]
              )
          ]
        )
    );
  }
}
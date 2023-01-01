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
                    CreateEditChat(),
                    Expanded(
                      child: Container(
                          width: 100,
                          child: ListView.builder(
                              itemCount: chats.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  height: 50,
                                  width: 100,
                                  color: Colors.green,
                                  child: Center(
                                      child: Text('Entry ${chats[index].usernames}')
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
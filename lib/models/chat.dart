import 'package:flutter/cupertino.dart';

class Message {
  String id;
  String from;
  String chatId;
  String content;

  Message(this.id, this.from, this.chatId, this.content);
}

class Chat extends ChangeNotifier {
  String id;
  List<String> usernames;
  List<Message> messages;

  Chat(this.id, this.usernames, this.messages);

  void addUsernames(List<String> newUsernames) {
    usernames.addAll(usernames);
    notifyListeners();
  }

  void addMessages(List<Message> newMessages) {
    messages.addAll(newMessages);
    notifyListeners();
  }
}
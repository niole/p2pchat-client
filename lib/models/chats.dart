import 'package:flutter/cupertino.dart';
import './chat.dart';

class Chats with ChangeNotifier {
  Chat? interactiveChat;
  List<Chat> _chats = <Chat>[];

  Chats(this._chats);

  Chat? getInteractiveChat() => interactiveChat;

  void setInteractiveChat(Chat? chat) {
    interactiveChat = chat;
    notifyListeners();
  }

  List<Chat> get chats => _chats;

  set chats(List<Chat> newChats) {
    this._chats = newChats;
    notifyListeners();
  }
}

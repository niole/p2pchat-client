import 'package:flutter/cupertino.dart';
import './chat.dart';

class Chats with ChangeNotifier {
  List<Chat> _chats = <Chat>[];

  Chats(this._chats);

  List<Chat> get chats => _chats;

  set chats(List<Chat> newChats) {
    this._chats = newChats;
    notifyListeners();
  }
}

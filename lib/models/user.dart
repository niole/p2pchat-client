import 'package:flutter/cupertino.dart';

class User extends ChangeNotifier {
  String? _user;
  String? get user => _user;

  set user(String? newUser) {
    _user = newUser;
    notifyListeners();
  }
}
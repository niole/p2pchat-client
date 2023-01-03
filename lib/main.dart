// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import './login.dart';
import './models/user.dart';
import './models/chat.dart';
import './models/chats.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => User()),
        ChangeNotifierProvider(create: (_) =>Chats(<Chat>[]))
      ],
      child: MaterialApp(
        title: 'Welcome to Flutter',
        theme: ThemeData(          // Add the 5 lines from here...
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
        ),
        home: const Login(),
    ));
    }
  }
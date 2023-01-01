// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
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

class RandomWords extends StatefulWidget {

  const RandomWords({ Key? key }): super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Startup Name Generator'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.list),
              tooltip: 'Saved Suggestions',
            ),
          ],
        ),
        body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return const Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }

          return ListTile(
              title: Text(
                  _suggestions[index].asPascalCase,
                  style: _biggerFont
              ),
              trailing: const Icon(    // NEW from here ...
                Icons.favorite_border,
                color: null,
                semanticLabel: 'Save',
              ),
              onTap: () {          // NEW from here ...
                setState(() {
                });                // to here.
              },
          );
      },
        )
    );
  }
}

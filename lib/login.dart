import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './models/user.dart';
import './chats.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(32.0),
          child: const UsernameInput()
     )
    );
  }
}

class UsernameInput extends StatefulWidget {
  const UsernameInput({super.key});

  @override
  State<UsernameInput> createState() => _UsernameInput();
}

class _UsernameInput extends State<UsernameInput> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myController.addListener(() {
      print("check name validity");
    });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: myController,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
          ElevatedButton(
            style:  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
            onPressed: () {
              Provider.of<User>(context, listen: false).user = myController.text;

              Navigator.of(context)
                  .push(
                    MaterialPageRoute(
                        builder: (ctx) => const ChatView()
                    )
                 );
            },
            child: const Text('Enter'),
          )
        ]
    );
  }
}
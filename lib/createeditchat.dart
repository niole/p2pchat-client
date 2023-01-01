import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:p2pchat/models/chat.dart';
import './models/chats.dart';
import 'package:provider/provider.dart';

class CreateEditChat extends StatelessWidget {
  const CreateEditChat({super.key});

  @override
  Widget build(BuildContext ctx) {
    return ElevatedButton(
      style:  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
      onPressed: () {
        Navigator.of(ctx).push(MaterialPageRoute(
          builder: (ctx) => const Scaffold(body: CreateEditChatForm())
        ));
      },
      child: const Text('Create Chat'),
    );
  }
}

class CreateEditChatForm extends StatefulWidget {
  const CreateEditChatForm({super.key});

  @override
  State<CreateEditChatForm> createState() => _CreateEditChatFormState();
}
class _CreateEditChatFormState extends State<CreateEditChatForm> {

 final _formKey = GlobalKey<FormBuilderState>();

 @override
  Widget build(BuildContext ctx) {
   return Scaffold(
     body: FormBuilder(
         key: _formKey,
         onChanged: () {
           _formKey.currentState!.save();
         },
         child: Center(
             child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   FormBuilderTextField(
                     autovalidateMode: AutovalidateMode.always,
                     name: 'usernames',
                     validator: FormBuilderValidators.required(),
                     decoration: const InputDecoration(border: OutlineInputBorder()),
                     keyboardType: TextInputType.multiline,
                     maxLines: null,
                   ),
                   ElevatedButton(
                     style:  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                     onPressed: () {
                       if (_formKey.currentState!.validate()) {
                         _formKey.currentState!.save();
                         final usernames = _formKey.currentState!.getRawValue("usernames");
                         final chatParticipants = usernames.split(",");

                         Provider.of<Chats>(ctx, listen: false).chats.add(
                             Chat("id", chatParticipants, <Message>[])
                         );

                        Navigator.pop(ctx);
                       }
                     },
                     child: const Text('Enter'),
                   )
                 ]
             )
         )
     )
   );
 }
}

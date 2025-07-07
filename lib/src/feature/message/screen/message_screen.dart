import 'package:flutter/material.dart';
import 'package:task1/src/core/extension/context_ext.dart';


class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(


        child:  Text("Message Screen Comping soon",style:  context.myTextTheme.bodyLarge,),
      ),
    );
  }
}
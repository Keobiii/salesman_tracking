import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 40.0),
        child: Container(
          child: Text('Chat Page'), 
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
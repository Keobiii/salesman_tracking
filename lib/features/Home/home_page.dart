import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 40.0),
        child: Container(
          child: Text('Home Page'), 
          color: Colors.red,
        ),
      ),
    );
  }
}
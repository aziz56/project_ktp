import 'package:flutter/material.dart';
import 'package:project_ktp/Presentation/create_chat_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Chat Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CreateChatPage(),
    );
  }
}
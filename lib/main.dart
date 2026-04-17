import 'package:flutter/material.dart';
import 'package:list_users/user_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: UserView(),
        ),
      ),
    );
  }
}

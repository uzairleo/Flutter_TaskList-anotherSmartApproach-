import 'package:flutter/material.dart';
import 'package:tasklist_flutter/HomePage.dart';
import 'package:tasklist_flutter/splashScreen.dart';

void main() {
  runApp(new MyTodo());
}

class MyTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task_Keeper',
      home: SplashScreen(),
    );
  }
}

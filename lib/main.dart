import 'package:flutter/material.dart';
import 'package:tasklist_flutter/HomePage.dart';

void main() {
  runApp(new MyTodo());
}

class MyTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task_Keeper',
      home: HomePage(),
    );
  }
}

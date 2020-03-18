import 'package:flutter/material.dart';

class AddNewTask extends StatefulWidget {
  @override
  _AddNewTaskState createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Dialog(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
              TextField(
                onSubmitted: (value)
                {

                },
                decoration: InputDecoration(
                  hintText: "Enter you task..",
                  ),
              ),
          ]
        ),
      ),
    );
  }
}
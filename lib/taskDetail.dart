import 'package:flutter/material.dart';
 var title;
class TaskDetail extends StatefulWidget {
 
  static String titleReturn(){
    // title="uzairleoTitle";
    return title;
  }
  @override
  _TaskDetailState createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Dialog(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            // Text(taskList[index]),
              TextField(
                onSubmitted: (value)
                {
                   title=value;
                },
                decoration: InputDecoration(
                  
                  hintText: "title",
                  ),
              ),
              FlatButton(onPressed: (){}, child: Text("save"))
          ]
        ),
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tasklist_flutter/taskList.dart';

class NewTaskPage extends StatefulWidget {
 List<TaskList> taskList=List();
  NewTaskPage(this.taskList);
  @override
  _NewTaskPageState createState() => _NewTaskPageState(taskList);
}

class _NewTaskPageState extends State<NewTaskPage> {
  List<TaskList> taskList=List();
  _NewTaskPageState(this.taskList);
  var title=TextEditingController();
  var subtitle=TextEditingController();
  var tasktime=TextEditingController();
  var tasColor;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 8.0,
      title: Text(
        "New Task",
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
      content: Container(
        height: 300,
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                    controller: title,
                    decoration: InputDecoration(
                      hintText: "title",
                      border: InputBorder.none,
                    ))),
            Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                    controller: subtitle,
                    decoration: InputDecoration(
                      hintText: "subTitle",
                      border: InputBorder.none,
                    ))),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                height: 40,
                child: Column(children: <Widget>[
                 Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          colorContainer(Colors.amber),
                          colorContainer(Colors.blue),
                          colorContainer(Colors.red),
                          colorContainer(Colors.orange),
                        ],
                      ))
                ]),
              ),
            ),
            
            Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                    controller: tasktime,
                    decoration: InputDecoration(
                      hintText: "taskTime",
                      border: InputBorder.none,
                    ))),
                    Padding(padding: const EdgeInsets.only(top: 45,right: 14.0,left: 150),
                    child:saveButton())
          ],
        ),
      ),
    );
  }
  saveButton()
  {
    return RaisedButton(
      onPressed: (){
            taskList.add(new TaskList(
              title: title.text,
              subTitle: subtitle.text,
              taskTime: tasktime.text,
              colorStatus: tasColor
            ));
            Navigator.of(context).pop();
         
      },
      shape: RoundedRectangleBorder(borderRadius:new BorderRadius.circular(30.0)),
      child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 18),),
      color: Colors.pink,
      colorBrightness: Brightness.dark,
      );
  }

  colorContainer(var color) {
    return GestureDetector(
        onTap: () {
        setState(() {
          tasColor=color;
        });
        },
        child: Icon(
          FontAwesomeIcons.squareFull,
          size: 20,
          color: color,
        ));
  }
}

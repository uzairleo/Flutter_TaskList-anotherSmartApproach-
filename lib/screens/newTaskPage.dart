import 'dart:io';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tasklist_flutter/models/taskList.dart';

class NewTaskPage extends StatefulWidget {
 List<TaskList> taskList=List();
 int index;
  NewTaskPage(this.taskList,this.index);
  @override
  _NewTaskPageState createState() => _NewTaskPageState(taskList,index);
}

class _NewTaskPageState extends State<NewTaskPage> {
  List<TaskList> taskList=List();
  int index;
  _NewTaskPageState(this.taskList,this.index);
  var title=TextEditingController();
  var subtitle=TextEditingController();
  var tasktime=TextEditingController();
  var tasktimeauto=TextEditingController();
  var tasColor;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // key: ValueKey(taskList[index].toString()),
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
                    autofocus: true,
                    obscureText: false,
                    onSubmitted: null,
                    decoration: InputDecoration(
                      hintText: "title",
                      border: InputBorder.none,
                    ))),
            Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                    controller: subtitle,
                    onSubmitted: (value){
                        setState(() {
          var dat=TimeOfDay.now().format(context);
            taskList.add(new TaskList(
              title: title.text,
              subTitle: subtitle.text,
              taskTime: dat,
              colorStatus: tasColor
              ));
              
            Navigator.of(context).pop();
        });
                    },
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
                          colorContainer(Colors.green),
                        ],
                      ))
                ]),
              ),
            ),
            
                    Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: DateTimeField(
                    // onFieldSubmitted: null,
                    format:  DateFormat("h:mm a"),
                    onShowPicker: (context, currentValue) async {
            final time = await showTimePicker(
              context: context,
              initialTime:
                  TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            );
            return DateTimeField.convert(time);
          },
                    controller: tasktimeauto,
                    decoration: InputDecoration(
                      hintText: "taskTimeauto",
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
        
        setState(() {
          var dat=TimeOfDay.now().format(context);
            taskList.add(new TaskList(
              title: title.text,
              subTitle: subtitle.text,
              taskTime: dat,
              colorStatus: tasColor
              ));
              
            Navigator.of(context).pop();
        });
         
      },
      shape: RoundedRectangleBorder(borderRadius:new BorderRadius.circular(30.0)),
      child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 18),),
      color: Colors.pink,
      colorBrightness: Brightness.dark,
      );
  }

  colorContainer(var color) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.0),
          onTap: (){
               setState(() {
          tasColor=color;
        });
          },
                  child: Container(
                    width: 30,
                    height: 30,
                    child: Icon(
            FontAwesomeIcons.squareFull,
            size: 20,
            color: color,
          ),
                  ),
        );
  }

  //Writting the ListTile Data to a local file there in each os device
  _save()
  async{
    try{
    final Directory  filePath=await getApplicationDocumentsDirectory();
    final  File writeFile=File("${filePath.path}/leoTask.text");
      String wData="My name is Muhammad Uzair";
      print(filePath);
    writeFile.writeAsStringSync(wData);
    }catch(Exception)
    {
      print("some Error Happened");
    }
  }

//a function that read ListTile data from that local file 
_read()
async{
  try{

    final Directory getPath= await getApplicationDocumentsDirectory();
    final File readFile=File("${getPath.path}/leoTask.text");
    String readText=readFile.readAsStringSync();
    print(readText);

  }catch(Exception)
  {
    print("Some Error Happened");
  }
}
}

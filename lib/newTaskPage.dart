import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewTaskPage extends StatefulWidget {
  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
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
                    controller: null,
                    decoration: InputDecoration(
                      hintText: "title",
                      border: InputBorder.none,
                    ))),
            Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                    controller: null,
                    decoration: InputDecoration(
                      hintText: "subTitle",
                      border: InputBorder.none,
                    ))),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                height: 40,
                child: Column(children: <Widget>[
                  // Padding(
                  //     padding: const EdgeInsets.only(top: 2.0),
                  //     child:
                  //     Text(
                  //       "Select Color",
                  //       style: TextStyle(fontSize: 18.0),
                  //     )),
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
                    controller: null,
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

      },
      shape: RoundedRectangleBorder(borderRadius:new BorderRadius.circular(30.0)),
      child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 18),),
      color: Colors.pink,
      colorBrightness: Brightness.dark,
      );
  }

  colorContainer(var color) {
    return GestureDetector(
        onTap: () {},
        child: Icon(
          FontAwesomeIcons.squareFull,
          size: 20,
          color: color,
        ));
  }
}

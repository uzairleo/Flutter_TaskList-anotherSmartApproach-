import 'package:flutter/material.dart';
import 'package:tasklist_flutter/taskList.dart';
import 'package:intl/intl.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
var day=DateFormat.d().format(DateTime.now());
var month=DateFormat.MMMM().format(DateTime.now());
var year=DateFormat.y().format(DateTime.now());
  int index;
    List<TaskList> taskList=new List();

    @override
  void initState() {
    super.initState();
      setState(() {
        // taskList.add(new TaskList(title: "dinner",subTitle: "Must do ",taskTime: "2:23pm",colorStatus: Colors.orange));
        // taskList.add(new TaskList(title: "dinner",subTitle: "Must do ",taskTime: "2:23pm",colorStatus: Colors.yellow));
        // taskList.add(new TaskList(title: "dinner",subTitle: "Must do ",taskTime: "2:23pm",colorStatus: Colors.brown));
        // taskList.add(new TaskList(title: "dinner",subTitle: "Must do ",taskTime: "2:23pm",colorStatus: Colors.purple));
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
        try{
           addDilogue();
        // removeFromTask(index);
        }catch(Exception)
        {
        //   print("Sorry Invalid index");
        }
        
        },
        child: Icon(Icons.add,color: Colors.black,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.pink,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.settings), onPressed: () {}),
          ],
        ),
      ),
      body:
       buildDashBoard(),
    );
  }

  Widget buildDashBoard() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink, Colors.purple],
                begin: Alignment.bottomLeft,
                end: Alignment(-1.0, -1.0),
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: ListTile(
                leading: Text(
                 day,
                  style: TextStyle(fontSize: 48,color: Colors.yellow),
                ),
                title: Text(month,style: TextStyle(fontSize: 28),),
                subtitle: Text(year,style: TextStyle(fontSize: 21),),
              ),
            ),
          ),
          Positioned(
              top: 140,
              left: 16.0,
              right: 16.0,
              child: Container(
                width: 380,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 25.0, // soften the shadow
                      spreadRadius: 5.0, //extend the shadow
                      offset: Offset(
                        15.0, // Move to right 10  horizontally
                        15.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                height: MediaQuery.of(context).size.height / 1.5,
                child:taskListView(),
              )),
        ],
      ),
    );
  }
  Widget taskListView() {
    return ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
         if(index<taskList.length)
         print(index);
          return taskListTile(taskList[index].title,taskList[index].subTitle,
          taskList[index].taskTime,taskList[index].colorStatus,index);
        });
  }

  Widget taskListTile(String title,String subtitle,String tasktime,Color tColor,int index) {
    this.index=index;
    return GestureDetector(
          onTap: (){
              addDilogue();
          },
          child: Container(
        height: 75,
        margin: EdgeInsets.only(top: 18.0),
        child: Material(
          shadowColor: Colors.grey,
          elevation: 9.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // SizedBox(width:10.0),
              Container(
                color: tColor,
                width: 8,
                // height:
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 4,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height:4.0),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          title,
                          style: TextStyle(
                              fontSize: 21.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(subtitle, style: TextStyle(
                          fontSize: 18.0)))
                    ]),
              ),
              Expanded(
                              child: Align(
                      alignment: Alignment.centerRight,
                       child: Padding(
                         padding: const EdgeInsets.only(right:6.0),
                         child: Text(tasktime,
                      style:TextStyle(fontSize:14),),
                       )),
                ),
            ],
          ),
        ),
      ),
    );
  }
  void addToTask(String value)
  {
    setState(() {
    int index=taskList.length;
    print("i am ListTile no "+index.toString());
    taskList.add(new TaskList(title: value,subTitle: "must",
    taskTime: "23:23pm",colorStatus: Colors.red));
    });
  }
  void removeFromTask(int index)
  {
    setState(() {
      
    taskList.removeAt(index);
  
    });
    }
    void addDilogue()
    {
      var titleController=TextEditingController();
      showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            // Text(taskList[index]),
           
              TextField(
                controller: titleController,
                onSubmitted: (value)
                {
                    // addToTask(value);
                },
                decoration: InputDecoration(
                  
                  hintText: "title",
                  ),
              ),
              FlatButton(onPressed: (){
                addToTask(titleController.text);
              }, child: Text("save"))
          ]
        ),
      );
      }
      );
      
    }
}
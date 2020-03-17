import 'package:flutter/material.dart';

void main()
{
  runApp(new MyTodo());
}

class MyTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task_Keeper',
      home: TaskKeeper(),
    );
  }
}
class TaskKeeper extends StatefulWidget {
  @override
  _TaskKeeperState createState() => _TaskKeeperState();
}

class _TaskKeeperState extends State<TaskKeeper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: (){

        },
        child: Icon(Icons.add),),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.pink,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
                IconButton(icon: Icon(Icons.settings), onPressed: (){}),
                IconButton(icon: Icon(Icons.verified_user), onPressed: (){}),
                
          ],
        ),
      ),
      body: buildDashBoard(),
    );
  }
  Widget buildDashBoard()
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height/3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pink,Colors.purple],
                  begin: Alignment.bottomLeft,
                  end: Alignment(-1.0,-1.0),
                ),
              ),
              child: Align(
                alignment:Alignment.centerLeft,
                child:ListTile(
                  leading:Text("12",style: TextStyle(fontSize:44),),
                  title:Text("March"),
                  subtitle:Text("2020"),
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
                  boxShadow:[
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
                ) ,
                height:MediaQuery.of(context).size.height/1.5,
              child: taskListView(),
              )
              ),

          ],
      ),
    );
  }
  Widget taskListView()
  {
    return ListView.builder(
                itemCount: 12,
                itemBuilder: (context,index)
                {
                  return taskListTile();
                });
  }

  Widget taskListTile()
  {
    return Container(
      height: 90,
      margin: EdgeInsets.only(top:20.0),
      // width: 200,
      child: Material(
        shadowColor: Colors.grey,
        elevation: 4.0,
        child: Row(
          mainAxisAlignment:MainAxisAlignment.start,
          children: <Widget>[
            // SizedBox(width:10.0),
            Container(
              color:Colors.orange,
              width:13,
              // height:
            ),
            SizedBox(width:20),
            Align(
              alignment:Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children:<Widget>[
                  Text("Main Title",
                  style: TextStyle(fontSize: 18.0),),
                  SizedBox(height:6.0),
                  Text("Subtitle",
                  style: TextStyle(fontSize: 14.0))
                ]
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:150.0),
              child: Align(
                alignment:Alignment.centerRight,
                child:Text("2:24pm")
              ),
            )
          ],
        ),
      ),
    );
  }
}

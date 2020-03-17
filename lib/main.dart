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
                height:MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context,index)
                {
                  return ListTile(title: Text("I am uzair leo"),);
                }),
              )
              ),

          ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:tasklist_flutter/taskDetail.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> taskList=[];
  int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
           addDilogue(
            //  taskList[index],index
           );
        // try{
        // removeFromTask(index);
        // }catch(Exception)
        // {
        //   print("Sorry Invalid index");
        // }
        
          // showDialog(context: context,
          // builder:(BuildContext context)=>TaskDetail());
        // Future.delayed(Duration(seconds: 6),(){
            // addToTask(TaskDetail.titleReturn());
        // });
    
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
            IconButton(icon: Icon(Icons.settings), onPressed: () {}),
            IconButton(icon: Icon(Icons.verified_user), onPressed: () {}),
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
                  "12",
                  style: TextStyle(fontSize: 48,color: Colors.yellow),
                ),
                title: Text("March",style: TextStyle(fontSize: 28),),
                subtitle: Text("2020",style: TextStyle(fontSize: 21),),
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
        // itemCount: 2,
        itemBuilder: (context, index) {
         if(index<taskList.length)
          return taskListTile(taskList[index],index);
        });
  }

  Widget taskListTile(String title,int index) {
    this.index=index;
    return GestureDetector(
          onTap: (){
              addDilogue(
                // title,index
              );
          },
          child: Container(
        height: 75,
        margin: EdgeInsets.only(top: 18.0),
        // width: 200,
        child: Material(
          shadowColor: Colors.grey,
          elevation: 9.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // SizedBox(width:10.0),
              Container(
                color: Colors.deepOrange,
                width: 8,
                // height:
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height:4.0),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          title,
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Subtitle", style: TextStyle(fontSize: 18.0)))
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 140.0,right:10.0),
                child: Align(
                    alignment: Alignment.centerRight, child: Text("2:24pm",
                    style:TextStyle(fontSize:14),)),
              )
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
    // taskList.add("Task no =>"+index.toString());
    taskList.add(value + index.toString());
    });
  }
  void removeFromTask(int index)
  {
    setState(() {
      
    taskList.removeAt(index);
  
    });
    }
    void addDilogue(
      // String title,int index
      )
    {
      showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            // Text(taskList[index]),
           
              TextField(
                onSubmitted: (value)
                {
                    addToTask(value);
                },
                decoration: InputDecoration(
                  
                  hintText: "title",
                  ),
              ),
              FlatButton(onPressed: (){
                print(TaskDetail.titleReturn());
              }, child: Text("save"))
          ]
        ),
      );
      }
      );
      
    }
}
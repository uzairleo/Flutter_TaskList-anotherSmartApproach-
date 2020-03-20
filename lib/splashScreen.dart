import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tasklist_flutter/HomePage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() { 
    super.initState();
    Future.delayed(
      Duration(
        seconds: 5,
        ),
    (){
      Navigator.push(context,MaterialPageRoute
      (
        builder:(context)=>(HomePage()))
        );
    }
    );
  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
         color: Color(0xff5a348b),
        gradient: LinearGradient(
          colors: [Color.fromARGB(255,180,28,229),Color.fromARGB(255,229,28,189)],
          begin:Alignment.centerRight,
          end:Alignment(-1.0,-1.0),
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>
        [
          Padding(padding: const EdgeInsets.only(top: 150),
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Colors.amber,
            child: CircleAvatar(
              backgroundColor: Colors.pinkAccent,
            radius: 53,
            child: Icon(Icons.note_add,size: 55,color: Colors.white,),

            ),
          ),
          ),
          Padding(padding: const EdgeInsets.only(top: 20.0),
          child:Text("Leo Todo",
          style: TextStyle(
            fontSize: 40,
            fontWeight:FontWeight.bold,
            color: Colors.white70,
          ),)),
          Padding(padding: const EdgeInsets.only(top: 80,bottom: 10),
          child:SpinKitDoubleBounce(color: Colors.white54,size: 60,),),
          Padding(padding: const EdgeInsets.only(top: 70.0),
          child:Text("Version 2.0",style: TextStyle(
            fontSize: 14.0,
            color:Colors.white70,
          ),)
          ),
            Text("@2020 uzairleo  ",style: TextStyle(
            fontSize: 12.0,
            color:Colors.white70,
          ))
        ]
      ),
  ),
    );  }
}
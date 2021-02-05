
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'cls.dart';


void main() {
  runApp(MyApp());
}
String val="Exit";

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  int t=0;

  List<data> abc = [
    data(roll: 1713310100,name:'Jatin Chaudhary'),
    data(roll: 1713310158,name:'Prateek Churasiya'),
    data(roll: 1713310106,name:'Khanak Gupta'),
    data(roll: 1713310160,name:'Priyanshu Kumar'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(

        backgroundColor: Colors.lightGreen,

        appBar: AppBar(

          title: Text(
                          "Weather Update",
                          style: TextStyle(
                           // color: Colors.white60,
                            ),
                      ),

          centerTitle: true,
          backgroundColor: Colors.black87,

          elevation: 0,
        ),

        floatingActionButton: FloatingActionButton(onPressed: () { setState(() {
          t=t+1;
        });},
        child : Icon(Icons.workspaces_filled),

        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,


        body:Center(
            child:Column(

              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,

          children: abc.map((e) =>  Text("Roll: ${e.roll}  Name: ${e.name}") ).toList()+[ Text("") ,Text(val),],
        ),),
      ),


    );
  }
}

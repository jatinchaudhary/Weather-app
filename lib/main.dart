
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  int t=0;

  List<String> abc = ["hey my name is jatin","I do study in College"];

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

          children: abc.map((e) =>  Text("$e") ).toList()+[ Text("hey")],
        ),),
      ),




    );
  }
}

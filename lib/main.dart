
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(

        backgroundColor: Colors.black45,

        appBar: AppBar(

          title: Text(
                          "Weather Update",
                          style: TextStyle(
                           // color: Colors.white60,
                            ),
                      ),

          centerTitle: true,
          backgroundColor: Colors.white12,

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


          children: [

            Text(" "),
            Text(" "),
            Text("DATA",style: TextStyle(color: Colors.white60),),
            Text("Current temperature : $t",style: TextStyle(color: Colors.white60),),
            Text(" "),
            FlatButton(onPressed: () { setState(() {
              t--;
            });},
              child: Icon(Icons.adjust_sharp), color: Colors.teal,onLongPress: (){setState(() {
                t++;
              });} ,),



          ],
        ),),
      ),




    );
  }
}

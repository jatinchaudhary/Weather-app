
import 'dart:collection';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'cls.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String location="";
  String country="";
  double temp=0;
  String ass="";
  String locate="";
  String view="";
  String icon="";

  var input=new TextEditingController();

  String url="https://api.weatherapi.com/v1/current.json?key=9be48fa4339c458ead841706212901&q=";

   @override
   void initState() {

     super.initState();
     this.jsonget();
   }

  Future<String> jsonget() async
  { if(locate!='')
    {
      var response= await http.get(url+locate);
      var aa=json.decode(response.body);
      if(response.statusCode<400)
      {
        print(response.body);
        print("respnse code :---------------");
        print(response.statusCode);
        setState(() {
          this.country=aa["location"]["country"];
          this.temp=aa["current"]["temp_c"];
          this.location=aa["location"]["name"];
          this.view=aa["current"]["condition"]["text"];
          this.icon=aa["current"]["condition"]["icon"];
        });
      }
      else{
        print(aa["error"]["message"]);
        setState(() {
          this.country="";
          this.temp=0;
          this.location="";
          this.view="";
          this.icon="";
        });
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home:
        Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: NetworkImage("https://i.pinimg.com/originals/aa/8d/a9/aa8da9413fe57e4e64ff50141ad77435.jpg"), fit: BoxFit.cover)),




      child:Scaffold(

        backgroundColor: Colors.blueAccent,

        appBar: AppBar(

          title: Text("Weather Update"),

          centerTitle: true,
          backgroundColor: Colors.black87,

          elevation: 0,
        ),

        floatingActionButton: FloatingActionButton(onPressed: () { },
        child : Icon(Icons.workspaces_filled),
          backgroundColor: Colors.deepOrange,

        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,


        body:Center(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Image.network("http:"+ icon, height: 100, width: 200,),

                TextField(
                  controller: input,
                  decoration: InputDecoration(
                    hintText: "Enter location",
                  ),

                ),


                RaisedButton(
                  onPressed: () { setState(() {
                    this.locate=input.text;
                  });
                  jsonget();
                  },
                child: Text("Submit"),),
                


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(

                    color: Colors.white,
                    child: Text("Location : $location",style: ( TextStyle( fontSize: 20)),),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(

                    color: Colors.white,
                    child: Text("Country : $country",style: ( TextStyle( fontSize: 20)),),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(

                    color: Colors.white,
                    child: Text("Temperature : $temp",style: ( TextStyle( fontSize: 20)),),
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(

                    color: Colors.white,
                    child: Text("View : $view",style: ( TextStyle( fontSize: 20)),),
                  ),
                ),





              ],
            ),

           ),
      ),

        ),

    );
  }
}

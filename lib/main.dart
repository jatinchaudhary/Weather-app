import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String location = "     -  ";
  String country = " - ";
  double temp = 0;
  String locate = "";
  String view = " -  -  - ";
  String icon = "//cdn.weatherapi.com/weather/64x64/night/113.png";
  double locLat = 0.0;
  double locLong = 0.0;
  double windSpeed = 0.0;
  int windDegree = 0;
  int humidity = 0;
  double visKm = 0.0;
  double uv = 0.0;

  void getCurrentLocation() async {
    var position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    var lastPos = await Geolocator().getLastKnownPosition();
    print(lastPos);

    setState(() {
      this.locLat = lastPos.latitude;
      this.locLong = lastPos.longitude;
    });
    jsonGet(1);
  }

  var input = new TextEditingController();

  String url =
      "https://api.weatherapi.com/v1/current.json?key=9be48fa4339c458ead841706212901&q=";

  @override
  void initState() {
    super.initState();
    this.jsonGet(0);
  }

  void jsonGet(int x) async {
    if (locate != '' || x == 1) {
      var response;
      if (x == 0)
        response = await http.get(url + locate);
      else
        response =
            await http.get(url + locLat.toString() + "," + locLong.toString());
      var aa = json.decode(response.body);
      if (response.statusCode < 400) {
        print(response.body);
        print("response code :---------------");
        print(response.statusCode);
        setState(() {
          this.country = aa["location"]["country"];
          this.temp = aa["current"]["temp_c"];
          this.location = aa["location"]["name"];
          this.view = aa["current"]["condition"]["text"];
          this.icon = aa["current"]["condition"]["icon"];

          this.windSpeed = aa["current"]["wind_kph"];
          this.windDegree = aa["current"]["wind_degree"];
          this.humidity = aa["current"]["humidity"];
          this.visKm = aa["current"]["vis_km"];
          this.uv = aa["current"]["uv"];
        });
      } else {
        print(aa["error"]["message"]);
        setState(() {
          this.country = " - ";
          this.temp = 0;
          this.location = "     -  ";
          this.view = " -  -  - ";
          this.icon = "//cdn.weatherapi.com/weather/64x64/night/113.png";

          this.windSpeed = 0.0;
          this.windDegree = 0;
          this.humidity = 0;
          this.visKm = 0.0;
          this.uv = 0.0;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        appBar: AppBar(
          title: Text(
            "Weather",
            style: TextStyle(
                letterSpacing: 1, fontWeight: FontWeight.bold,fontSize: 25),
          ),
          //centerTitle: true,
          backgroundColor: Colors.blue[800],
          elevation: 0,
        ),

        drawer: Drawer(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                height: 150,
                child: Center(
                    child: Text(
                  "Details",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.blue, Colors.deepOrange]),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Icon(Icons.whatshot),
                  Text(" Temperature        $temp \u2103"),
                ],
              ),
              Divider(),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Icon(Icons.ac_unit_sharp),
                  Text(" Condition             $view"),
                ],
              ),
              Divider(),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Icon(Icons.all_out_rounded),
                  Text(" Humidity              " + humidity.toString()),
                ],
              ),
              Divider(),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Icon(Icons.speed),
                  Text(" Wind speed         " + windSpeed.toString()),
                ],
              ),
              Divider(),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Icon(Icons.text_rotation_angleup),
                  Text(" Wind degree        " + windDegree.toString()),
                ],
              ),
              Divider(),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Icon(Icons.remove_red_eye),
                  Text(" Visibility               " + visKm.toString() + " km"),
                ],
              ),
              Divider(),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Icon(Icons.hot_tub_rounded),
                  Text(" UV radiation         " + uv.toString()),
                ],
              ),
              Divider(),
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            getCurrentLocation();
          },
          child: Icon(
            Icons.my_location_outlined,
            size: 30,
          ),
          backgroundColor: Colors.blueAccent,
        ),

        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue, Colors.red]),
          ),

          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$temp \u2103",
                          style: (TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        Text(
                          "$location, $country",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          "http:" + icon,
                          height: 50,
                          width: 60,
                        ),
                        Text(
                          "$view",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          color: Colors.white38,
                        ),
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: input,
                          cursorColor: Colors.black,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            hintText: "Enter location",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FlatButton.icon(
                      onPressed: () {
                        setState(() {
                          this.locate = input.text;
                        });
                        jsonGet(0);
                      },
                      icon: Icon(Icons.search),
                      label: Text("Search"),
                      color: Colors.white38,
                      shape: StadiumBorder(),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:dsc_sastra_university/teamDisplay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'aboutUsDisplay.dart';
import 'eventsDisplay.dart';
import 'homeDisplay.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Product Sans",
        primarySwatch: Colors.blue,
      ),
      //for event :Event
      // home: Event("Google Cloud Platform"),

      //for aboutMember : use AboutMember
      // home: AboutMember("sibi")
      routes: {
        "/": (_) => HomePage(),
        "/aboutus": (_) => AboutUsDisplay(),
        "/events": (_) => EventsDisplay(),
        "/team": (_) => TeamDisplay()
        // "/": (_) => Event("Machine learning"),
        // "/": (_) => Member(dpsize: 16,name: 'ashwin',github: "",dribble: "",linkedin: "",image: "assets/ar.jpg",size: 20,team: "Android",),
      },
    );
  }
}

import 'package:dsc_sastra_university/eventDisplay.dart';
import 'package:dsc_sastra_university/gallery.dart';
import 'package:dsc_sastra_university/pages/home.dart' as prefix0;
import 'package:dsc_sastra_university/pages/team.dart';
import 'package:flutter/material.dart';
import 'package:dsc_sastra_university/Home.dart';
import 'package:dsc_sastra_university/pages/event.dart';
// import 'package:dsc_sastra_university/event.dart';
import 'package:dsc_sastra_university/pages/aboutus.dart';
import 'package:dsc_sastra_university/pages/aboutMember.dart';
import 'package:dsc_sastra_university/pages/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        "/aboutus": (_) => AboutUs(),
        "/events":(_)=>EventDisplay(),
        // "/": (_) => Event("Machine learning"),
        // "/": (_) => Member(dpsize: 16,name: 'ashwin',github: "",dribble: "",linkedin: "",image: "assets/ar.jpg",size: 20,team: "Android",),
      },

      //for about us : use about us
      // home: AboutUs()
    );
  }
}

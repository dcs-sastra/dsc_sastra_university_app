import 'package:dsc_sastra_university/gallery.dart';
import 'package:dsc_sastra_university/pages/home.dart' as prefix0;
import 'package:dsc_sastra_university/pages/team.dart';
import 'package:flutter/material.dart';
import 'package:dsc_sastra_university/Home.dart';
// import 'package:dsc_sastra_university/pages/event.dart';
import 'package:dsc_sastra_university/event.dart';
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
        primarySwatch: Colors.blue,
      ),
      //for event :Event
      // home: Event("Google Cloud Platform"),

      //for aboutMember : use AboutMember
      // home: AboutMember("sibi")
      routes: {
        // "/": (_) => HomePage(),
        // "/": (_) => AboutUs(),
        "/": (_) => Event("Machine learning club"),
      },

      //for about us : use about us
      // home: AboutUs()
    );
  }
}

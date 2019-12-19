import 'package:dsc_sastra_university/resourcesDisplay.dart';
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

      title: 'DSC SASTRA University',
      theme: ThemeData(
        fontFamily: "Product Sans",
        primarySwatch: Colors.blue,
      ),

      routes: {
        "/": (_) => HomePage(),
        "/aboutus": (_) => AboutUsDisplay(),
        "/events": (_) => EventsDisplay(),
        "/team": (_) => TeamDisplay(),
        "/resources": (_) => ResourcesDisplay(),
      },
    );
  }
}

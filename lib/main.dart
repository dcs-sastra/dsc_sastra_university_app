

import 'package:dsc_sastra_university/pages/home.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:dsc_sastra_university/Home.dart';
import 'package:dsc_sastra_university/pages/event.dart';
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
      //for aboutMember : use AboutMember
      //for about us : use about us
      home: Event("Google Cloud Platform"),
    );
  }
}


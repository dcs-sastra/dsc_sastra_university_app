

import 'package:flutter/material.dart';
import 'package:dsc_sastra_university/Home.dart';
import 'package:dsc_sastra_university/pages/event.dart';
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
      
      home: Event("gcp"),
    );
  }
}


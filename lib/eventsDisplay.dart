import 'package:after_layout/after_layout.dart';
import 'package:dsc_sastra_university/widgets/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'api/eventApi.dart';

double screenWidth;

class EventsDisplay extends StatefulWidget {
  @override
  _EventsDisplayState createState() => _EventsDisplayState();
}

class _EventsDisplayState extends State<EventsDisplay> with AfterLayoutMixin {
  List<Widget> events = [];

  bool isLoaded = false;

  @override
  void afterFirstLayout(BuildContext context) async {
    events = (await EventApi.getEvents()).map((f) => ZeshEvent(f)).toList();

    if (mounted) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        textTheme: TextTheme(title: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 2,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          "Events",
          style: TextStyle(
              fontSize: 20,
              fontFamily: "Product Sans",
              fontWeight: FontWeight.w400),
        ),
      ),
      body: isLoaded
          ? ListView.builder(
              itemCount: events.length,
              itemBuilder: (bc, i) => Container(
                height: MediaQuery.of(context).size.height / 3,
                child: events[i],
              ),
              physics: BouncingScrollPhysics(),
            )
          : Container(
              child: Center(
              child: CircularProgressIndicator(),
            )),
    );
  }
}

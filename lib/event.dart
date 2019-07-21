import 'package:flutter/material.dart';

class Event extends StatefulWidget {
  Event({Key key}) : super(key: key);

  _EventState createState() => _EventState();
}

class _EventState extends State<Event> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 400,
                    color: Colors.white,
                  ),
                  Container(
                    color: Colors.redAccent,
                    height: 300,
                    width: double.infinity,
                    child: Image.asset("assets/logo.png"),
                  ),
                  Positioned(
                    top: 280,
                    left: 64,
                    right: 64,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightBlueAccent,
                      ),
                      
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search),
                            hintText: "Search",
                          ),
                        ),
                      
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

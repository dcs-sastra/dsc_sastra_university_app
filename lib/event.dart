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
                    height: 350,
                    color: Colors.white,
                  ),
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: ExactAssetImage("assets/events.jpg"),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    top: 250,
                    left: 64,
                    right: 64,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2,
                              color: Colors.blueGrey,
                            )
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
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

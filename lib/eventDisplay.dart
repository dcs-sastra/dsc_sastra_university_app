import 'package:flutter/material.dart';

class EventDisplay extends StatefulWidget {
  @override
  _EventDisplayState createState() => _EventDisplayState();
}

class _EventDisplayState extends State<EventDisplay> {
  @override
  Widget build(BuildContext context) {
    double _animatedHeight = 100.0;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Event Display"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new GestureDetector(
                      onTap: () => setState(() {
                        _animatedHeight != 0.0
                            ? _animatedHeight = 0.0
                            : _animatedHeight = 100.0;
                      }),
                      child: new Container(
                        child: new Text("CLICK ME"),
                        color: Colors.blueAccent,
                        height: 25.0,
                        width: 100.0,
                      ),
                    ),
                    new AnimatedContainer(
                      duration: const Duration(milliseconds: 120),
                      child: new Text("Toggle Me"),
                      height: _animatedHeight,
                      color: Colors.tealAccent,
                      width: 100.0,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Animated extends StatelessWidget {
  int count;
  Animated(count) {
    this.count = count;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: GridView.count(
          crossAxisCount: count,
          childAspectRatio: 1,
          // padding: EdgeInsets.only(left: 32, right: 32, top: 16),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage("assets/flutter.jpg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        color: Colors.black.withOpacity(0.25))
                  ]),
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              // child: Image.asset("assets/flutter.jpg"),
              // color: Colors.white,
              width: 50,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Image.asset("assets/studyjam.jpg"),
              color: Colors.blueAccent,
              width: 50,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              color: Colors.greenAccent,
              width: 50,
            )
          ]),
    );
  }
}

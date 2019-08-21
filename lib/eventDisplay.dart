import 'package:flutter/material.dart';

class EventDisplay extends StatefulWidget {
  @override
  _EventDisplayState createState() => _EventDisplayState();
}

class _EventDisplayState extends State<EventDisplay> {
  double _animatedHeightFlutter = 150.0;
  double _animatedHeightAndroid = 150.0;
  double _animatedHeightMl = 150.0;

  @override
  Widget build(BuildContext context) {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Flutter",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: "ProductSans"),
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _animatedHeightFlutter != 150.0
                              ? _animatedHeightFlutter = 150.0
                              : _animatedHeightFlutter = 300.0;
                        });
                      },
                      child: Text(
                        "Expand",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      )),
                ],
              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 16,
                  ),
                  new AnimatedContainer(
                    transform: Matrix4.translationValues(0, 0, -1),
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 120),
                    child: new Animated(_animatedHeightFlutter == 150 ? 1 : 2),
                    height: _animatedHeightFlutter,
                    // color: Colors.tealAccent,
                    width: double.infinity,
                  ),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Android workshop",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _animatedHeightAndroid != 150.0
                              ? _animatedHeightAndroid = 150.0
                              : _animatedHeightAndroid = 300.0;
                        });
                      },
                      child: Text(
                        "Expand",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      )),
                ],
              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 16,
                  ),
                  new AnimatedContainer(
                    transform: Matrix4.translationValues(0, 0, -1),
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 120),
                    child: new Animated(_animatedHeightAndroid == 150 ? 1 : 2),
                    height: _animatedHeightAndroid,
                    // color: Colors.tealAccent,
                    width: double.infinity,
                  ),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Machine Learning",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _animatedHeightMl != 150.0
                              ? _animatedHeightMl = 150.0
                              : _animatedHeightMl = 300.0;
                        });
                      },
                      child: Text(
                        "Expand",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      )),
                ],
              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 16,
                  ),
                  new AnimatedContainer(
                    transform: Matrix4.translationValues(0, 0, -1),
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 120),
                    child: new Animated(_animatedHeightMl == 150 ? 1 : 2),
                    height: _animatedHeightMl,
                    // color: Colors.tealAccent,
                    width: double.infinity,
                  ),
                ],
              ),
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
      margin: EdgeInsets.all(0),
      height: 100,
      child: GridView.count(
          crossAxisCount: count,
          childAspectRatio: 1,
          scrollDirection: Axis.horizontal,
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
                        blurRadius: 1,
                        offset: Offset(0, 4),
                        color: Colors.black.withOpacity(0.2))
                  ]),
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              width: 100,
            ),
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
              width: 100,
            ),
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
              width: 100,
            ),
          ]),
    );
  }
}

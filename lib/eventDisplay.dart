import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter/material.dart' as prefix0;

class EventDisplay extends StatefulWidget {
  @override
  _EventDisplayState createState() => _EventDisplayState();
}

double w;

class _EventDisplayState extends State<EventDisplay> {
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        textTheme: TextTheme(
            title: TextStyle(
          color: Colors.black,
        )),
        iconTheme: IconThemeData(color: Colors.grey),
        elevation: 2,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          "Event Display",
          style: TextStyle(fontSize: 20,fontFamily: "Product Sans", fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          
            TitleOfClub("On Going Events"),
            Animated(1),
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Next Event",
                    style: TextStyle(fontSize: 24, fontFamily: "Product Sans"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // color: Colors.black,
                height: w * 0.55,
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: ExactAssetImage("assets/studyjam.jpg"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      width: 175,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 32, left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Google Cloud",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Expected November",
                            style: TextStyle(),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text("Mention Later",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 30,
                          ),
                          ButtonTheme(
                            height: 35,
                            minWidth: 100,
                            child: RaisedButton(
                              color: Colors.blue[300],
                              shape: StadiumBorder(),
                              child: Text(
                                "Know more",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(1)),
                              ),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            TitleOfClub("Up Coming"),
            Container(
              margin: EdgeInsets.all(0),
              height: w * 0.6,
              child: GridView.count(
                  crossAxisCount: 1,
                  childAspectRatio: 1,
                  scrollDirection: Axis.horizontal,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: <Widget>[
                    UpComing("assets/github.png", "Github Session"),
                    UpComing("assets/FlutterIcon.png", "Flutter Session"),
                    UpComing("assets/cloud.png", "GCP Session"),
                    UpComing("assets/Android-Icon.png", "Android Session"),
                  ]),
            ),
          ],
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
    double w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(0),
      height: w * 0.6,
      child: GridView.count(
          crossAxisCount: 1,
          childAspectRatio: 1,
          scrollDirection: Axis.horizontal,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage("assets/dsc/mlWorkshop.jpg"),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                      offset: Offset(0, 4),
                      color: Colors.black.withOpacity(0.2),
                    )
                  ]),
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              width: 300,
            ),
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage("assets/dsc/Web.jpg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        color: Colors.black.withOpacity(0.25))
                  ]),
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              width: 100,
            ),
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage("assets/events/liveStream.jpg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        color: Colors.black.withOpacity(0.25))
                  ]),
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              width: 100,
            ),
          ]),
    );
  }
}

class Recent extends StatelessWidget {
  String poster;
  Recent(this.poster);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage(poster), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                offset: Offset(0, 4),
                color: Colors.black.withOpacity(0.25))
          ]),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      width: 100,
    );
  }
}

class TitleOfClub extends StatelessWidget {
  String title;
  TitleOfClub(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16,top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "Product Sans"),
          ),
          // IconButton(
          //   icon: Icon(
          //     Icons.arrow_forward,
          //     color: Colors.grey,
          //     size: 32,
          //   ),
          //   onPressed: () {},
          // )
        ],
      ),
    );
  }
}

class UpComing extends StatelessWidget {
  String image, title;
  UpComing(this.image, this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Stack(
        children: <Widget>[
          new ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: Image.asset(image)),
          new Center(
            child: new ClipRect(
              child: new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: new Container(
                  width: w * 0.6,
                  height: w * 0.6,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade200.withOpacity(0.5)),
                  child: new Center(
                    child: new Text(
                      title,
                      style: Theme.of(context).textTheme.display3,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

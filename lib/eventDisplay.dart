import 'package:flutter/material.dart';

class EventDisplay extends StatefulWidget {
  @override
  _EventDisplayState createState() => _EventDisplayState();
}

class _EventDisplayState extends State<EventDisplay> {
  

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
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
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Container(
                width: double.infinity,
                height: w*0.6,
                child: PageView(
                  controller: PageController(viewportFraction: 0.9),
                  scrollDirection: Axis.horizontal,
                  pageSnapping: true,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (c) =>
                        //         Event("Google cloud platform")));
                      },
                      child: Recent("assets/studyjam.jpg"),
                    ),
                    Recent("assets/events.jpg"),
                  ],
                ),
              ),
            ),
            TitleOfClub("Flutter"),
            Animated(1),
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Up Coming",
                    style: TextStyle(fontSize: 24, fontFamily: "Product Sans"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // color: Colors.black,
                height: w*0.55,
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: ExactAssetImage("assets/flutter.jpg"),
                            fit: BoxFit.fill),
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

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "12/11/19",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text("Tifa core auditorium",
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
            TitleOfClub("Machine Learning"),
            Animated(1)
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
      height: w *0.6,
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
                      image: ExactAssetImage("assets/flutter.jpg"),
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
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontSize: 24,
                // fontWeight: FontWeight.bold,
                fontFamily: "Product Sans"),
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_forward,
              color: Colors.grey,
              size: 32,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

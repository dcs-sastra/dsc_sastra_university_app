// import 'package:dsc_sastra_university/pages/eventList.dart';
import 'package:flutter/material.dart';

class Event extends StatelessWidget {
  double w;
  var date, venue;
  String title,discription;

  
  Event(this.title,this.date,this.venue,this.discription,this.speaker);
  var speaker = new List(3);

  @override
  Widget build(BuildContext context) {
    speaker = ["Vishal R", "Anju", "Sreenithi"];
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
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
          title,
          style: TextStyle(
              fontSize: 20,
              fontFamily: "Product Sans",
              fontWeight: FontWeight.bold),
        ),
      ),
      body: LayoutBuilder(
        builder: (ctx, bc) => SingleChildScrollView(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  MyPadding(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.date_range,
                          color: Colors.black,
                          size: 32,
                        ),
                        SizedBox(width: 16),
                        Text(
                          "Date : ",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          date,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                  MyPadding(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Colors.black,
                          size: 32,
                        ),
                        SizedBox(width: 16),
                        Text(
                          "Venue : ",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          venue,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                  MyPadding(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Description",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 32,
                          // fontFamily: "ProductSans",
                        ),
                      ),
                    ),
                  ),
                  MyPadding(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "\t$discription",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 0),
                    child: Container(
                      width: w * 0.4,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xFFDB4437).withOpacity(0.25),
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(50),
                        ),
                      ),
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Color(0xFFDB4437),
                          fontSize: 18,
                          // fontFamily: "ProductSans",
                        ),
                      ),
                    ),
                  ),
                  MyPadding(
                    child: Text(
                      "Speakers",
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: "ProductSans",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: Container(
                      height: w * 0.4,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          3,
                          (i) => Container(
                            width: w * 0.3,
                            height: double.maxFinite,
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  height: w * 0.2,
                                  width: w * 0.2,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage("assets/ar.jpg"),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text(speaker[i], style: TextStyle(fontSize: 16))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyPadding extends StatelessWidget {
  final Widget child;
  MyPadding({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      child: child,
    );
  }
}

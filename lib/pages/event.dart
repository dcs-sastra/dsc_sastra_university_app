// import 'package:dsc_sastra_university/pages/eventList.dart';
import 'package:flutter/material.dart';



class Event extends StatelessWidget {
  double w;
  String title;
  Event(this.title);

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Google Cloud Study Jam",
          style: TextStyle(),
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
                          "16th August, 2019",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
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
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "CTV 110",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
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
                        "          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eget maximus eros. Curabitur mollis hendrerit tincidunt. Praesent tellus lectus, ullamcorper semper libero nec, placerat scelerisque lectus. Suspendisse dictum ultricies nisl, eget laoreet felis placerat et. Maecenas dictum erat ac eros tempor, in scelerisque sem pretium. Praesent sed dui eros. Quisque interdum molestie tempus. Nullam mollis tincidunt orci. In mollis augue eu risus vestibulum facilisis.",
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
                          10,
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
                                Text("Sibi N", style: TextStyle(fontSize: 16))
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

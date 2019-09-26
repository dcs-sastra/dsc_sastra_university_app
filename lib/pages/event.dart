// import 'package:dsc_sastra_university/pages/eventList.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
import 'package:dsc_sastra_university/Home.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Event extends StatelessWidget {
  double w;
  String date, venue, title, discription, speakers, reg_link, id;
  bool thumbnail;

  String poster;
  Event(this.title, this.date, this.venue, this.discription, this.speakers,
      this.reg_link, this.id, this.poster);

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  Hero(
                    tag: id,
                    child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            color: Colors.black.withOpacity(0.25),
                          )
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image(
                          image: CachedNetworkImageProvider(poster),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _launchURL(reg_link),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 18, horizontal: 0),
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
                          speakers.split(",").length,
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
                                AutoSizeText(
                                  speakers.split(",")[i],
                                  style: TextStyle(fontSize: 8),
                                ),
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

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_sastra_university/utility/utils.dart';
import 'package:dsc_sastra_university/widgets/event.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:image_downloader/image_downloader.dart';
// import 'package:share/share.dart';

class Event extends StatefulWidget {
  String date, venue, title, main, description, speakers, reg_link, id;
  bool thumbnail, canRegister;

  String poster;

  Event(this.title, this.date, this.venue, this.main, this.description,
      this.speakers, this.reg_link, this.id, this.poster, this.canRegister);

  @override
  State<StatefulWidget> createState() {
    return _EventState(
        this.title,
        this.date,
        this.venue,
        this.main,
        this.description,
        this.speakers,
        this.reg_link,
        this.id,
        this.poster,
        this.canRegister);
  }
}

class _EventState extends State<Event> {
  double screenWidth;
  String date, venue, title, main, description, speakers, reg_link, id;
  bool thumbnail, canRegister;

  String poster;

  _EventState(this.title, this.date, this.venue, this.main, this.description,
      this.speakers, this.reg_link, this.id, this.poster, this.canRegister);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          textTheme: TextTheme(
              title: TextStyle(
            color: Colors.black,
          )),
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 2,
          backgroundColor: Colors.white,
          centerTitle: false,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              splashColor: Colors.lightBlue,
              onPressed: () async {
                String base64k = await ImageDownloader.downloadImage(
                  poster,
                  destination: AndroidDestinationType.custom(directory: "DSC")
                    ..subDirectory("poster.png"),
                );
                print(base64k);
              },
            )
          ],
          title: Hero(
            tag: id + "appBar",
            child: Material(
              color: Colors.transparent,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Product Sans",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        body: LayoutBuilder(
          builder: (ctx, bc) => SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // Date and Venue widget
                    Padding(
                      padding: EdgeInsets.only(
                          top: 8, bottom: 8, right: 16, left: 16),
                      child: Card(
                        elevation: 8.0,
                        color: Colors.blueAccent,
                        child: Column(
                          children: <Widget>[
                            // Date Widget
                            Padding(
                              padding: EdgeInsets.only(top: 16, bottom: 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.date_range,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    date,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),

                            //Venue Widget
                            Padding(
                              padding: EdgeInsets.only(top: 8, bottom: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    venue,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //Main Widget
                    MyPadding(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          main,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    // Description Widget
                    MyPadding(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "$description",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),

                    // Poster
                    Center(
                      child: MyPadding(
                        child: Hero(
                          tag: id,
                          child: Container(
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                  color: Colors.black.withOpacity(0.25),
                                )
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image(
                                image: CachedNetworkImageProvider(poster),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Register Button
                    GestureDetector(
                      onTap: () => {if (canRegister) launchURL(reg_link)},
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 18, horizontal: 0),
                        child: Container(
                          width: screenWidth * 0.4,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Color(0xFFDB4437).withOpacity(0.3),
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(60),
                            ),
                          ),
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: canRegister
                                  ? Color(0xFFDB4437).withOpacity(1.0)
                                  : Color(0xFFDB4437).withOpacity(0.5),
                              // Add a condition -> Text opacity = 1.0 if date is available for registration or else Text opacity = 0.5
                              fontWeight: canRegister
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              // Add a condition -> Text bold if date is available for registration or else normal Text
                              fontSize: 18,
                              // fontFamily: "ProductSans",
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Speakers
                    MyPadding(
                      child: speakers.length == 0
                          ? SizedBox(height: 0)
                          : Text(
                              "Speakers",
                              style: TextStyle(
                                fontSize: 28,
                                fontFamily: "ProductSans",
                              ),
                            ),
                    ),

                    // Speakers List
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      child: Container(
                        height: screenWidth * 0.4,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            speakers.split(",").length,
                            (i) => Container(
                              width: screenWidth * 0.3,
                              height: double.maxFinite,
                              padding: EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    height: screenWidth * 0.2,
                                    width: screenWidth * 0.2,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage("assets/ar.jpg"),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  FittedBox(
                                    child: AutoSizeText(
                                      speakers.split(",")[i],
                                      maxLines: 2,
                                      minFontSize: 14,
                                      maxFontSize: 24,
                                      softWrap: true,
                                      wrapWords: true,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
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
      ),
    );
  }
}

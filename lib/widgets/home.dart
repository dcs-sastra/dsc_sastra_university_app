import 'package:date_format/date_format.dart';
import 'package:dsc_sastra_university/api/env.dart';
import 'package:dsc_sastra_university/api/eventApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

import '../eventDisplay.dart';

class ZeshEvent extends StatelessWidget {
  final EventPODO event;

  ZeshEvent(this.event);

  @override
  Widget build(BuildContext context) {
    DateTime presentDateTime = DateTime.now();
    return GestureDetector(
      onTap: () {
        print("Tap registerd !");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => Event(
                event.name,
                formatDate(event.date, [d, ' ', MM, ' ', yy, ', ', DD]),
                event.venue,
                event.main,
                event.description,
                event.speakers,
                event.register_link,
                event.id,
                event.poster,
                presentDateTime.compareTo(event.date) == -1)));
      },
      child: Thumbnail(event.poster, event.name, event.id),
    );
  }
}

class Cluster extends StatelessWidget {
  String icon;
  int color;

  Cluster(String icon, int color) {
    this.icon = icon;
    this.color = color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(
          color,
        ).withOpacity(0.25),
      ),
      child: Center(
        child: Container(
            child: SvgPicture.asset(
          icon,
          // height: 10,
          // width: 10,
          fit: BoxFit.contain,
        )),
      ),
    );
  }
}

class Thumbnail extends StatelessWidget {
  String poster, title, id;

  Thumbnail(this.poster, this.title, this.id);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: id,
      child: Container(
        padding: EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(poster),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black54,
              BlendMode.srcATop,
            ),
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              offset: Offset(0, 4),
              color: Colors.black.withOpacity(0.25),
            )
          ],
        ),
        alignment: Alignment.bottomLeft,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}

Widget showEventsList(bool isLoaded, List<Widget> events) {
  return PageView(
    controller: PageController(viewportFraction: 0.8, keepPage: true),
    scrollDirection: Axis.horizontal,
    physics: BouncingScrollPhysics(),
    pageSnapping: true,
    children: isLoaded
        ? events
        : [
            Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
  );
}

Widget showEmptyPlaceHolder(bool isLoaded) {
  return isLoaded
      ? Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "There are no events to catch up right now!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 20),
            ),
            Text(
              "We will update here if there're any...",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Mean while follow us ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      fontSize: 16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    socialMediaIconHomePage(
                        "assets/linkedin.svg", 16, 16, 8, Colors.blue),
                    socialMediaIconHomePage(
                        "assets/medium.svg", 16, 16, 8, Colors.black),
                    socialMediaIconHomePage(
                        "assets/instagram.svg", 16, 16, 8, null)
                  ],
                ),
              ],
            )
          ],
        )
      : Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
}

Widget socialMediaIconHomePage(
    String filePath, double height, double width, double padding, Color color) {
  return (color != null)
      ? Padding(
          padding: EdgeInsets.all(padding),
          child: GestureDetector(
            onTap: () {
              instaURL();
            },
            child: Container(
              height: height,
              width: height,
              child: SvgPicture.asset(
                filePath,
                color: color,
              ),
            ),
          ),
        )
      : Padding(
          padding: EdgeInsets.all(padding),
          child: GestureDetector(
            onTap: () {
              instaURL();
            },
            child: Container(
              height: height,
              width: height,
              child: SvgPicture.asset(
                filePath,
              ),
            ),
          ),
        );
}

mediumURL() async {
  const url = dscSASTRAMediumURL;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

linkedinURL() async {
  const url = dscSASTRALinkedInURL;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

instaURL() async {
  const url = dscSASTRAInstaURL;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void choiceAction(String choice) {}

class Constants {
  static const List<String> choices = ["Share"];
}

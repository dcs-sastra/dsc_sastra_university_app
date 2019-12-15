import 'package:date_format/date_format.dart';
import 'package:dsc_sastra_university/api/env.dart';
import 'package:dsc_sastra_university/api/eventApi.dart';
import 'package:dsc_sastra_university/utility/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../clusterDisplay.dart';
import '../eventDisplay.dart';

/*    Events   */
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

/*
    Helper Method to show when there are no events in place of upcoming and recent events.
   */
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
                    socialMediaIconHomePage("assets/linkedin.svg",
                        dscSASTRALinkedInURL, 16, 16, 8, Colors.blue),
                    socialMediaIconHomePage("assets/medium.svg",
                        dscSASTRAMediumURL, 16, 16, 8, Colors.black),
                    socialMediaIconHomePage("assets/instagram.svg",
                        dscSASTRAInstaURL, 16, 16, 8, null)
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

/*
    Helper Method to show social media icons in EmptyPlaceHolder widget.
   */
Widget socialMediaIconHomePage(String filePath, String url, double height,
    double width, double padding, Color color) {
  return (color != null)
      ? Padding(
          padding: EdgeInsets.all(padding),
          child: GestureDetector(
            onTap: () {
              launchURL(url);
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
              launchURL(url);
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

/*
 Popup menu button's action will implement here @choiceAction
 */
void choiceAction(String choice) {}

/*
 List of options for Popup menu button will be defined @choices - List<String>
 */
class Constants {
  static const List<String> choices = ["Share"];
}

/*  Clusters*/

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

/*
    Helper functions to display cluster icons in the cluster widget.
    @displaySVGClusterIcon is used to display svg icons
    @displayClusterIcon is used to display normal icons
 */
Widget displaySVGClusterIcon(BuildContext context,
    ClusterDisplay clusterDisplay, int color, String svgFilePath) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (c) => clusterDisplay,
        ),
      );
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(color).withOpacity(0.25),
      ),
      child: Center(
        child: Container(
            child: SvgPicture.asset(
              svgFilePath,
              height: 40,
              width: 40,
              fit: BoxFit.contain,
            )),
      ),
    ),
  );
}

Widget displayClusterIcon(BuildContext context, ClusterDisplay clusterDisplay,
    Cluster cluster) {
  return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (c) => clusterDisplay,
          ),
        );
      },
      child: cluster);
}

import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Member extends StatelessWidget {
  final String name, github, twitter, linkedin, image;
  Member({
    @required this.name,
    @required this.github,
    @required this.twitter,
    @required this.linkedin,
    @required this.image,
  });

  double size;
  double dpsize;

  @override
  Widget build(BuildContext context) {
    dpsize = (MediaQuery.of(context).size.width - 16) / 3;
    size = min(dpsize * 1.2, 480);
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (_) {
            return Container(
              height: 100,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    onPressed: () async {
                      _launchURL(github);
                    },
                    icon: SvgPicture.asset("assets/icons/gh.svg"),
                  ),
                  IconButton(
                    onPressed: () async {
                      _launchURL(linkedin);
                    },
                    icon: Image.asset("assets/li.png"),
                  ),
                  IconButton(
                    onPressed: () async {
                      _launchURL(twitter);
                    },
                    icon: Image.asset(
                      "assets/twitter.png",
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircleAvatar(
              radius: dpsize / 2.8,
              backgroundImage: CachedNetworkImageProvider(image),
            ),
            SizedBox(height: max(16, size * 0.1)),
            Text(
              name,
              style: TextStyle(
                fontFamily: "ProductSans",
                fontSize: max(24, size * 0.1),
              ),
            ),
            // Text(
            //   ,
            //   textAlign: TextAlign.center,
            //   overflow: TextOverflow.visible,
            //   maxLines: 1,
            //   softWrap: false,
            //   style: TextStyle(
            //     fontFamily: "ProductSans",
            //     fontSize: max(16, size * 0.05),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

// Dei sibi get the data from backend and create a map of list as shown below da and dont forget to cache things

Member lead = Member(
  name: "Kavin Raju",
  image:
      "https://dsc-sastra-university.github.io/DSC-Website/static/media/Kavin%20Raju.49f2f013.jpg",
  github: "https://github.com/ZeshanGIT/",
  twitter: "https://github.com/ZeshanGIT/",
  linkedin: "https://github.com/ZeshanGIT/",
);

Map<String, List<Member>> members = {
  "Android Developers": [
    Member(
      name: "Sibi N",
      image:
          "https://dsc-sastra-university.github.io/DSC-Website/static/media/Sibi%20Nehru.e1a413ec.jpg",
      linkedin: "",
      twitter: null,
      github: "https://github.com/ZeshanGIT/",
    ),
    Member(
      name: "Sibi N",
      image:
          "https://dsc-sastra-university.github.io/DSC-Website/static/media/Sibi%20Nehru.e1a413ec.jpg",
      linkedin: "",
      twitter: null,
      github: "",
    ),
    Member(
      name: "Sibi N",
      image:
          "https://dsc-sastra-university.github.io/DSC-Website/static/media/Sibi%20Nehru.e1a413ec.jpg",
      linkedin: "",
      twitter: null,
      github: "",
    ),
  ],
  "Flutter Developers": [
    Member(
      name: "Sibi N",
      image:
          "https://dsc-sastra-university.github.io/DSC-Website/static/media/Sibi%20Nehru.e1a413ec.jpg",
      linkedin: "",
      twitter: null,
      github: "",
    ),
    Member(
      name: "Sibi N",
      image:
          "https://dsc-sastra-university.github.io/DSC-Website/static/media/Sibi%20Nehru.e1a413ec.jpg",
      linkedin: "",
      twitter: null,
      github: "",
    ),
    Member(
      name: "Sibi N",
      image:
          "https://dsc-sastra-university.github.io/DSC-Website/static/media/Sibi%20Nehru.e1a413ec.jpg",
      linkedin: "",
      twitter: null,
      github: "",
    ),
  ]
};
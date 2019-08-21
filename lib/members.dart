import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Member extends StatelessWidget {
  final String name, github, dribble, linkedin, image;
  Member({
    @required this.name,
    @required this.github,
    @required this.dribble,
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
                    onPressed: () => _launchURL(github),
                    icon: SvgPicture.asset("assets/gh.svg"),
                  ),
                  IconButton(
                    onPressed: () => _launchURL(linkedin),
                    icon: Image.asset("assets/tw.svg"),
                  ),
                  IconButton(
                    onPressed:
                        dribble != null ? () => _launchURL(dribble) : null,
                    icon: Image.asset(
                      "assets/ar.jpg",
                      color: dribble == null ? null : Colors.grey,
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
              backgroundImage: AssetImage("assets/$name.png"),
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
  github: null,
  dribble: null,
  linkedin: null,
);

Map<String, List<Member>> members = {
  "Android Developers": [
    Member(
      name: "Sibi N",
      image:
          "https://dsc-sastra-university.github.io/DSC-Website/static/media/Sibi%20Nehru.e1a413ec.jpg",
      linkedin: "",
      dribble: null,
      github: "",
    ),
    Member(
      name: "Sibi N",
      image:
          "https://dsc-sastra-university.github.io/DSC-Website/static/media/Sibi%20Nehru.e1a413ec.jpg",
      linkedin: "",
      dribble: null,
      github: "",
    ),
    Member(
      name: "Sibi N",
      image:
          "https://dsc-sastra-university.github.io/DSC-Website/static/media/Sibi%20Nehru.e1a413ec.jpg",
      linkedin: "",
      dribble: null,
      github: "",
    ),
    Member(
      name: "Sibi N",
      image:
          "https://dsc-sastra-university.github.io/DSC-Website/static/media/Sibi%20Nehru.e1a413ec.jpg",
      linkedin: "",
      dribble: null,
      github: "",
    ),
    Member(
      name: "Sibi N",
      image:
          "https://dsc-sastra-university.github.io/DSC-Website/static/media/Sibi%20Nehru.e1a413ec.jpg",
      linkedin: "",
      dribble: null,
      github: "",
    ),
  ]
};

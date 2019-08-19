import 'dart:math';

import 'package:flutter/material.dart';
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
    size = min(dpsize * 1.8, 480);
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (_) {
            return Container(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    onPressed: () => _launchURL(github),
                    icon: Image.asset("assets/ar.jpg"),
                  ),
                  IconButton(
                    onPressed: () => _launchURL(linkedin),
                    icon: Image.asset("assets/ar.jpg"),
                  ),
                  IconButton(
                    onPressed:
                        dribble.isNotEmpty ? () => _launchURL(dribble) : null,
                    icon: Image.asset(
                      "assets/ar.jpg",
                      color: dribble.isNotEmpty ? null : Colors.grey,
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
            Hero(
              tag: name,
              child: CircleAvatar(
                radius: dpsize / 2.8,
                backgroundImage: AssetImage("assets/$name.png"),
              ),
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

//Dei sibi get the data from backend and create a map of list as shown below da and dont forget to cache things

// const Map<String, List<Member>> members = {
//   "Android Developers" : [
//     Member(
//       name: "Kathir Thaniyarasu",
//       image: null,
//       linkedin: "",
//     )
//   ]
// };

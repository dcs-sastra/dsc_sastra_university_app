import 'dart:math';

import 'package:flutter/material.dart';

class Team extends StatelessWidget {
  double dpsize;
  var size;
  String team;
  Team(this.team);

  @override
  Widget build(BuildContext context) {
    dpsize = (MediaQuery.of(context).size.width - 16) / 3;

    size = min(dpsize * 1.8, 480);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8),
        child: GridView.count(
          childAspectRatio: dpsize / size,
          crossAxisCount: 3,
          children: <Widget>[
            Container(),
            // Member(dpsize: dpsize, size: size),
            Container(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircleAvatar(
                    radius: dpsize / 2.8,
                    backgroundImage: AssetImage("assets/sibi.png"),
                  ),
                  SizedBox(height: max(16, size * 0.1)),
                  Text(
                    "Sibi N",
                    style: TextStyle(
                      fontFamily: "ProductSans",
                      fontSize: max(24, size * 0.1),
                    ),
                  ),
                  Text(
                    "Android Lead",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "ProductSans",
                      fontSize: max(16, size * 0.05),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircleAvatar(
                    radius: dpsize / 2.8,
                    backgroundImage: AssetImage("assets/sibi.png"),
                  ),
                  SizedBox(height: max(16, size * 0.1)),
                  Text(
                    "Sibi N",
                    style: TextStyle(
                      fontFamily: "ProductSans",
                      fontSize: max(24, size * 0.1),
                    ),
                  ),
                  Text(
                    "Web Lead",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontFamily: "ProductSans",
                      fontSize: max(16, size * 0.05),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircleAvatar(
                    radius: dpsize / 2.8,
                    backgroundImage: AssetImage("assets/sibi.png"),
                  ),
                  SizedBox(height: max(16, size * 0.1)),
                  Text(
                    "Sibi N",
                    style: TextStyle(
                      fontFamily: "ProductSans",
                      fontSize: max(24, size * 0.1),
                    ),
                  ),
                  Text(
                    "ML Lead",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontFamily: "ProductSans",
                      fontSize: max(16, size * 0.05),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Member extends StatelessWidget {
  String name, team, image, github, dribble, linkedin;
  Member({
    Key key,
    @required this.dpsize,
    @required this.size,
    @required this.name,
    @required this.team,
    @required this.image,
    @required this.github,
    @required this.linkedin,
    this.dribble,
  }) : super(key: key);

  final double dpsize;
  final size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => Scaffold(
            body: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Hero(
                        tag: "sibi",
                        child: CircleAvatar(
                          radius: dpsize / 2.8,
                          backgroundImage: AssetImage("assets/sibi.png"),
                        ),
                      ),
                      SizedBox(height: max(16, size * 0.1)),
                      Text(
                        "Sibi N",
                        style: TextStyle(
                          fontFamily: "ProductSans",
                          fontSize: max(24, size * 0.1),
                        ),
                      ),
                      Text(
                        "DSC Lead",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyle(
                          fontFamily: "ProductSans",
                          fontSize: max(16, size * 0.05),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Hero(
              tag: "sibi",
              child: CircleAvatar(
                radius: dpsize / 2.8,
                backgroundImage: AssetImage("assets/sibi.png"),
              ),
            ),
            SizedBox(height: max(16, size * 0.1)),
            Text(
              "Sibi N",
              style: TextStyle(
                fontFamily: "ProductSans",
                fontSize: max(24, size * 0.1),
              ),
            ),
            Text(
              "DSC Lead",
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
              maxLines: 1,
              softWrap: false,
              style: TextStyle(
                fontFamily: "ProductSans",
                fontSize: max(16, size * 0.05),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

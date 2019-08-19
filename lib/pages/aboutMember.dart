import 'package:flutter/material.dart';

class AboutMember extends StatelessWidget {
  // String name;
  // AboutMember(this.name);
  double w;

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 32),
                  Hero(
                    tag: "sibi",
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/sibi.png"),
                      radius: 64,
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(
                    "Sibi N",
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: "ProductSans",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "DSC Lead",
                    style: TextStyle(fontSize: 24, fontFamily: "ProductSans"),
                  ),
                  SizedBox(height: 32),
                  Text(
                    "Area of intrest",
                    style: TextStyle(fontSize: 24, fontFamily: "ProductSans"),
                  ),
                  Column(
                    children: <Widget>[
                      area("computer vision"),
                      area("Natural Language Processing"),
                    ],
                  ),
                  SizedBox(height: 32),
                  Text(
                    "Contribution",
                    style: TextStyle(fontSize: 24, fontFamily: "ProductSans"),
                  ),
                  Column(
                    children: <Widget>[
                      area("computer vision"),
                      area("Natural Language Processing"),
                    ],
                  ),
                  SizedBox(height: 32),
                  Text(
                    "Links",
                    style: TextStyle(fontSize: 28, fontFamily: "ProductSans"),
                  ),
                  SizedBox(height: 16),
                  Container(
                    // color: Colors.black,
                    height: 60,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Link("assets/ar.jpg", "GitHub"),
                        Link("assets/ar.jpg", "LinkedIn"),
                        Link("assets/ar.jpg", "Dribble"),
                        Link("assets/ar.jpg", "Twitter"),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget area(String name) {
    return Padding(
      padding: EdgeInsets.only(left: 16, bottom: 8, top: 8),
      child: Row(
        children: <Widget>[
          MyBullet(),
          SizedBox(
            width: 10,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 16, fontFamily: "ProductSans"),
          )
        ],
      ),
    );
  }
}

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 10.0,
      width: 10.0,
      decoration: new BoxDecoration(
        color: Colors.black87,
        shape: BoxShape.circle,
      ),
    );
  }
}

class Link extends StatelessWidget {
  String name, icon;

  Link(icon, name) {
    this.icon = icon;
    this.name = name;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton.icon(
        shape: StadiumBorder(),
        color: Colors.white,
        onPressed: () {},
        label: Text(name),
        icon: Image.asset(
          icon,
          height: 40,
        ),
      ),
    );
  }
}

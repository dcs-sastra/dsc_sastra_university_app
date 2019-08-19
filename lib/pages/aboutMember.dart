import 'package:flutter/material.dart';

class AboutMember extends StatelessWidget {
  String name;
  AboutMember(this.name);
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
                    "Links",
                    style: TextStyle(fontSize: 28, fontFamily: "ProductSans"),
                  ),
                  SizedBox(height: 16),
                  RaisedButton.icon(
                    shape: StadiumBorder(),
                    color: Colors.white,
                    onPressed: () {},
                    label: Text("Github"),
                    icon: Image.asset(
                      "assets/ar.jpg",
                      height: w * 0.1,
                    ),
                  ),
                  RaisedButton.icon(
                    shape: StadiumBorder(),
                    color: Colors.white,
                    onPressed: () {},
                    label: Text("Github"),
                    icon: Image.asset(
                      "assets/ar.jpg",
                      height: w * 0.1,
                    ),
                  ),
                  RaisedButton.icon(
                    shape: StadiumBorder(),
                    color: Colors.white,
                    onPressed: () {},
                    label: Text("Github"),
                    icon: Image.asset(
                      "assets/ar.jpg",
                      height: w * 0.1,
                    ),
                  ),
                  RaisedButton.icon(
                    shape: StadiumBorder(),
                    color: Colors.white,
                    onPressed: () {},
                    label: Text("Github"),
                    icon: Image.asset(
                      "assets/ar.jpg",
                      height: w * 0.1,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

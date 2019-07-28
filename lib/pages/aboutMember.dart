import 'package:flutter/material.dart';

class AboutMember extends StatelessWidget {
  String name;
  AboutMember(this.name);

  @override
  Widget build(BuildContext context) {
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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Github",
                        style: TextStyle(color: Colors.white),
                      ),
                      Image.asset(
                        "assets/ghlogo.png",
                        color: Colors.white,
                        fit: BoxFit.cover,
                        height: 32,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

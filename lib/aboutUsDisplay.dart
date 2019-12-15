import 'package:dsc_sastra_university/widgets/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'api/env.dart';

class AboutUsDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: TextTheme(title: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 2,
        centerTitle: false,
        title: Text(
          "About Us",
          style: TextStyle(
              fontSize: 20,
              fontFamily: "Product Sans",
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 8.0, left: 16, right: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Image.asset(
                    "assets/dsc sastra.png",
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(
                  top: 0, bottom: 8.0, left: 16, right: 16),
              child: Text(
                aboutUsDSC,
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 0.5,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 0, bottom: 8.0, left: 16, right: 16),
              child: Text(
                aboutUsDSCSubline,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 0, bottom: 8.0, left: 16, right: 16),
              child: RichText(
                text: TextSpan(
                  text: 'Click here to know more about the community',
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontSize: 10.0),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launch(dscCommunityUrl);
                    },
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 24, bottom: 8.0, left: 16, right: 16),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Email Us:",
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          "dsc.sastra.university@gmail.com",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 8, bottom: 8.0, left: 16, right: 16),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Website:",
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: RichText(
                          text: TextSpan(
                            text: "http://dsc.sastratbi.in/",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                launch(dscSASTRAUrl);
                              },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16, bottom: 8.0, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.black45,
                    height: 2,
                    width: screenWidth * 0.17,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5, left: 5),
                    child: Text("Connect with us at",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                  Container(
                    color: Colors.black45,
                    height: 2,
                    width: screenWidth * 0.17,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 4, bottom: 8.0, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      linkedinURL();
                    },
                    child: Container(
                      height: aboutUsSocialMediaIconSize,
                      width: aboutUsSocialMediaIconSize,
                      // color: Colors.green,
                      child: SvgPicture.asset(
                        "assets/linkedin.svg",
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      mediumURL();
                    },
                    child: Container(
                      height: aboutUsSocialMediaIconSize,
                      width: aboutUsSocialMediaIconSize,
                      child: SvgPicture.asset(
                        "assets/medium.svg",
                        color: Colors.black,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      instaURL();
                    },
                    child: Container(
                      height: aboutUsSocialMediaIconSize,
                      width: aboutUsSocialMediaIconSize,
                      child: SvgPicture.asset(
                        "assets/instagram.svg",
                        // color: Colors.redAccent,
                      ),
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

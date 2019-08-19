import 'dart:math';

import 'package:dsc_sastra_university/members.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  double size;
  double dpsize;

  @override
  Widget build(BuildContext context) {
    dpsize = (MediaQuery.of(context).size.width - 16) / 3;
    size = min(dpsize * 1.2, 480);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "About Us",
          style: TextStyle(fontFamily: "ProductSans"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: lead,
              ),
              Container(height: 24),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Android Developers",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Container(
                height: size,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(width: 8),
                    ...members["Android Developers"]
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Android Developers",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Container(
                height: size,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(width: 8),
                    ...members["Android Developers"]
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

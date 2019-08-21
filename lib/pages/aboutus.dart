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
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "About Us",
          style: TextStyle(fontFamily: "ProductSans", color: Colors.black),
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
              ...List.generate(members.keys.length, (i) {
                String title = members.keys.elementAt(i);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        title,
                        style: TextStyle(fontSize: max(24, size * 0.15)),
                      ),
                    ),
                    Container(
                      height: size,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(width: 8),
                          ...members[title]
                        ],
                      ),
                    ),
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

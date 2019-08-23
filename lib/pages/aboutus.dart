import 'dart:math';

import 'package:after_layout/after_layout.dart';
import 'package:dsc_sastra_university/api/Api.dart';
import 'package:dsc_sastra_university/api/Member.dart';
import 'package:dsc_sastra_university/members.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> with AfterLayoutMixin<AboutUs> {
  double size;
  double dpsize;
  APIHelper apiHelper = APIHelper();
  Map<String, List<MyMember>> members;

  @override
  void afterFirstLayout(BuildContext context) async {
    var mems = (await apiHelper.getAllMembers()).members;
    List<String> clusts = mems.map((f) => f.cluster).toList().toSet().toList();

    var clusters = {
      "mob": "Android Development",
      "web": "Web Development",
      "ml": "Machine Learning",
      "gcp": "Google Cloud Platform",
      "graphics": "Graphic Designing",
      "content": "Content Writing",
      "events": "Event Management",
      "marketing": "Marketing"
    };

    setState(() {
      members = Map.fromIterable(clusts,
          key: (f) => clusters[f],
          value: (f) {
            return mems
                .where((test) => test.cluster == f)
                .map(
                  (f) => MyMember(
                    name: f.name,
                    image: f.imageURL,
                    linkedin: f.links[0],
                    github: f.links[1],
                    twitter: f.links[2],
                  ),
                )
                .toList();
          });
    });
  }

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
              if (members != null)
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

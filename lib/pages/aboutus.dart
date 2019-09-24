import 'dart:math';

import 'package:after_layout/after_layout.dart';
import 'package:dsc_sastra_university/api/membersApi.dart';
// import 'package:dsc_sastra_university/api/Api.dart';
// import 'package:dsc_sastra_university/api/Member.dart';
import 'package:dsc_sastra_university/members.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> with AfterLayoutMixin<AboutUs> {
  double size;
  double dpsize;
  Map<String, List<MyMember>> members;

  @override
  void afterFirstLayout(BuildContext context) async {
    Map<String, dynamic> mems = (await MemberApi.getMembers());
    List<String> clusts = mems.keys.toList();

    var clusters = {
      "app": "Android Development",
      "flutter": "Flutter",
      "web": "Web Development",
      "ml": "Machine Learning",
      "cloud": "Google Cloud Platform",
      "graphic": "Graphic Designing",
      "content": "Content Writing",
      "events": "Event Management",
      "marketing": "Marketing"
    };

    // setState(() {
    //members
    var k = clusts.map(
      (clust) {
        // print("Cluster: $clust");
        // return clust;
        if (clusters.keys.toList().contains(clust))
          mems[clust].map((clustMem) {
            // print("Clust Mem: $clustMem");
            return MyMember(
              github: "",
              linkedin: "",
              twitter: "",
              image: clustMem["imgUrl"],
              name: clustMem["name"],
            );
          }).toList();
      },
    ).toList();
    print(k);
    // });
  }

  @override
  Widget build(BuildContext context) {
    dpsize = (MediaQuery.of(context).size.width - 16) / 3;
    size = min(dpsize * 1.2, 480);
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () => Navigator.of(context).popAndPushNamed("/aboutus"),
      ),
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

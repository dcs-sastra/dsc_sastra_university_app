import 'dart:math';

import 'package:after_layout/after_layout.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
  Map<String, List<MyMember>> members = {};
  MyMember lead;

  bool isLoaded = false;

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
        if (clusters.containsKey(clust)) {
          List<MyMember> memList = [];
          print("*******$clust*****");
          print(mems[clust]);
          for (var item in mems[clust]) {
            memList.add(
              MyMember(
                github: "",
                linkedin: "",
                twitter: "",
                image: item["imgUrl"],
                name: item["name"],
              ),
            );
          }

          members[clusters[clust]] = memList;
        }

        var leadMap = mems["lead"];

        lead = MyMember(
          github: "",
          linkedin: "",
          twitter: "",
          image: leadMap["imgUrl"],
          name: leadMap["name"],
        );

        //   mems[clust].map((clustMem) {
        //     // print("Clust Mem: $clustMem");
        //     return MyMember(
        //       github: "",
        //       linkedin: "",
        //       twitter: "",
        //       image: clustMem["imgUrl"],
        //       name: clustMem["name"],
        //     );
        //   }).toList();
      },
    ).toList();
    print("#####Final Mem#####");
    print(members["Android Development"].length);

    setState(() {
      isLoaded = true;
    });

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
      body: isLoaded
          ? SingleChildScrollView(
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
                            child: AutoSizeText(
                              title,
                              style: TextStyle(
                                fontSize: max(24, size * 0.15),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            height: size,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: title1(title),
                              itemBuilder: (bc, i) => Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(width: 8),
                                  members[title][i],
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    })
                  ],
                ),
              ),
            )
          : Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }

  int title1(title) {
    print(title);
    switch (title) {
      case "Android Development":
        return 4;
      case "Web Development":
        return 6;
      case "Flutter":
        return 1;
      case "Machine Learning":
        return 6;
      case "Google Cloud Platform":
        return 1;
      case "Graphic Designing":
        return 0;
      case "Content Writing":
        return 2;
      case "Marketing":
        return 4;
    }
  }
}

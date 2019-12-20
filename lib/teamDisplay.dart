import 'package:after_layout/after_layout.dart';
import 'package:dsc_sastra_university/widgets/team.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'api/teamApi.dart';

class TeamDisplay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TeamDisplayState();
}

class TeamDisplayState extends State<TeamDisplay>
    with AfterLayoutMixin<TeamDisplay> {
  TeamPODO wholeTeam;
  double dpSize;
  bool _isLoaded = false;
  var clusters = [
    "Android Development",
    "Flutter",
    "Web Development",
    "Machine Learning",
    "Cloud",
    "AR/VR",
    "Graphic Designing",
    "Event Coverage",
    "Marketing and Corporate Relations",
    "Content Writing",
  ];

  @override
  void afterFirstLayout(BuildContext context) async {

    wholeTeam = await TeamApi.getMembersList();
    print("Whole team - App");
    print(wholeTeam.clusterWiseTeamMembers[clusters[0]].length);
    if (mounted) {
      setState(() {
        _isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double dpsize = MediaQuery.of(context).orientation == Orientation.portrait ?
    MediaQuery.of(context).size.width < 600
        ? (MediaQuery.of(context).size.width - 16) / 3
        : (MediaQuery.of(context).size.width - 16) / 5
    : (MediaQuery.of(context).size.width - 16) / 10;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Team",
            style: TextStyle(color: Colors.black),
          ),
        ),

        body: _isLoaded
            ? ListView.builder(
          physics: BouncingScrollPhysics(),
          // +1 is given to show Lead's widget also.
          itemCount: wholeTeam.clusterWiseTeamMembers.length + 1,
          // num of clusters + lead
          itemBuilder: (buildContext, i) =>
              Container(
                child: i == 0 // display lead's widget
                    ? Container(
                  /* decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: AssetImage("assets/splash.png"),
                            fit: BoxFit.cover
                          ),
                        ),*/
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                        child: Text(
                          "DSC Lead",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      teamMemberWidget(
                          context,
                          wholeTeam.lead.name,
                          wholeTeam.lead.imageUrl,
                          wholeTeam.lead.linkedin,
                          wholeTeam.lead.github,
                          wholeTeam.lead.twitter,
                          dpsize + 30),
                      Divider(
                        thickness: 1.2,
                      )
                    ],
                  ),
                )
                    : Column( // display each cluster's widget
                  children: <Widget>[
                    SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.only(left: 16,  right: 16),
                      child: Text(
                        clusters[i - 1],
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 3.5,
                      // display each cluster's members horizontally
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: wholeTeam
                            .clusterWiseTeamMembers[clusters[i - 1]]
                            .length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (buildContext, ii) =>
                            Container(
                              child: teamMemberWidget(
                                  context,
                                  wholeTeam
                                      .clusterWiseTeamMembers[clusters[i - 1]]
                                  [ii]
                                      .name,
                                  wholeTeam
                                      .clusterWiseTeamMembers[clusters[i - 1]]
                                  [ii]
                                      .imageUrl,
                                  wholeTeam
                                      .clusterWiseTeamMembers[clusters[i - 1]]
                                  [ii]
                                      .linkedin,
                                  wholeTeam
                                      .clusterWiseTeamMembers[clusters[i - 1]]
                                  [ii]
                                      .github,
                                  wholeTeam
                                      .clusterWiseTeamMembers[clusters[i - 1]]
                                  [ii]
                                      .twitter,
                                  dpsize),
                            ),
                      ),
                    ),
                    Divider(
                      thickness: 1.2,
                    )
                  ],
                ),
              ),
        )
            : Container(
            child: Center(
              child: CircularProgressIndicator(),
            )),
      ),
    );
  }
}

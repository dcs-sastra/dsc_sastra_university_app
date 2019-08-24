import 'package:dsc_sastra_university/aboutCluster.dart';
import 'package:dsc_sastra_university/cluster.dart';
import 'package:dsc_sastra_university/eventDisplay.dart';
import 'package:dsc_sastra_university/pages/aboutMember.dart';
import 'package:dsc_sastra_university/pages/aboutus.dart';
import 'package:dsc_sastra_university/pages/event.dart';
import 'package:flutter/foundation.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'aboutCluster.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class DrawerItem extends StatelessWidget {
//  var  aboutClus=new aboutCluster();
  // String android = aboutClus.android;
  final String title, route;
  final IconData icon;

  DrawerItem(this.title, this.route, this.icon);

  @override
  Widget build(BuildContext context) {
    Color color = title == "Home" ? Colors.blue : Colors.black;
    Color bgColor =
        title == "Home" ? Colors.blue.withOpacity(0.2) : Colors.white;
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(route),
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: EdgeInsets.only(right: 16, top: 16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: color,
              size: 26,
            ),
            SizedBox(
              width: 24,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: color,
                fontWeight:
                    title == "Home" ? FontWeight.bold : FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<DrawerItem> drawerItems = [
  DrawerItem("Home", "/home", Icons.home),
  DrawerItem("Events", "/events", Icons.event),
  DrawerItem("About Us", "/aboutus", Icons.info),
];

class _HomePageState extends State<HomePage> {
  var speakerDSC = new List(3);
  var speakerGCP = new List(3);

  var speakerML = new List(3);

  var aboutclus = new aboutCluster();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  int c = 0;
  double w, h;

  @override
  Widget build(BuildContext context) {
    speakerDSC = ["Jaikanth", "Sivaneshwar", "Kathir"];
    speakerGCP = ["Vishal", "Kappil", "Sreenithi"];
    speakerML = ["Anju", "Gokul", "Vishal R"];
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: FlatButton.icon(
          icon: Image.asset("assets/logo.png"),
          label: Text(
            "DSC SASTRA",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          disabledTextColor: Colors.black,
          onPressed: null,
        ),
        centerTitle: true,
      ),
      drawer: buildDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 32, top: 16, bottom: 16),
                    child: Text(
                      "Recent",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  Container(
                    height: h * 0.3,
                    child: PageView(
                      controller: PageController(viewportFraction: 0.8),
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (c) => Event(
                                      "Google DSC Summit",
                                      "24th August, 2019",
                                      "NMV audi ",
                                      """We’re gonna have one of the most exciting Saturday ever! 

We have planned for an EXCLUSIVE Live Stream of the Developer Student Club (DSC) Summit'19, India which includes:
●  Inspirational Keynotes
●  Expert talks on the current technologies (Android, Web, Cloud & Machine Learning )
●  Career Panel Discussion by Google Developer Experts

Date: 24th August'19 (Saturday)
Time: 9:30 AM to 1:00 PM
Venue: Will be sent in the confirmation mail.
Registration link: bit.ly/dscsummitlivestream 

NOTE: Since we have only Limited Seats, preference will be First Come First Serve.

#dsc #developersclub #dscsummit2019 #indiadscsummit  #developersclub #developer #dsc19 #google #summit2019 """,
                                      speakerDSC)));
                            },
                            child: Recent("assets/events/liveStream.jpg")),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (c) => Event(
                                      "CareerReadinessProgram",
                                      "9th August, 2019",
                                      "TifaCore ",
                                      """Bringing up #CareerReadinessProgram for Shanmugha Arts, Science, Technology and Research Academy students in collaboration with SASTRA's Technology Business Incubator.

Participate in this #CloudStudyJam and the successful candidates will get a chance to be a part of this #CareerReadinessProgram and become Google Cloud Platform Certified Candidate.

Thanks to Sowmya Kannan Nandhini Rangan for bringing this initiative to our campus and  Vijayaraghavan Parthasarathy for supporting. 

A Special Thanks to Sridharan VenkataRamanan for implementing on our campus.

Seats are limited! Do Hurry Up Guys!

#googlecloudplatform #googlecloud""",
                                      speakerGCP)));
                            },
                            child: Recent("assets/events/gcp.jpg")),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (c) => Event(
                                      "Machine Learning Workshop",
                                      "16th April, 2019",
                                      "TifaCore ",
                                      """In recent years, the tech world is abuzz with *Machine Learning*. But what exactly is it?

We, the "Developer Student Club" at SASTRA warmly welcome students who are interested in the imbuing field of ML. This is a great opportunity to develop a deep understanding of ML and to solve real-world challenges.
An introductory session on ML and key insights on the various resources available will be covered by the Core Team Members.Interested students can register for this *free* workshop.
We absolutely don't want you to miss this chance!

_Limited seats_ only, register ASAP""",
                                      speakerML)));
                            },
                            child: Recent("assets/events/ml.jpg")),
                        // Recent("ass")
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 32, top: 16, bottom: 16),
                child: Text(
                  "Clusters",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Container(
                height: h * 0.6,
                // color: Colors.redAccent,
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  padding: EdgeInsets.only(left: 32, right: 32, top: 16),
                  mainAxisSpacing: 32,
                  crossAxisSpacing: 32,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (c) => ClusterDisplay(
                                  "App Devlopment",
                                  aboutclus.android,
                                  "assets/clusterBackground/androidBackground.jpg"),
                            ),
                          );
                        },
                        child: Cluster(
                            "assets/icons/android-logo.svg", 0xff0F9D58)),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (c) => ClusterDisplay(
                                  "web Devlopment",
                                  aboutclus.web,
                                  "assets/clusterBackground/webBackground.jpg"),
                            ),
                          );
                        },
                        child: Cluster("assets/icons/web-programming (1).svg",
                            0xffDB4437)),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (c) => ClusterDisplay(
                                "Flutter",
                                aboutclus.flutter,
                                "assets/clusterBackground/flutterBackground.png"),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(
                            0xff4285F4,
                          ).withOpacity(0.25),
                        ),
                        child: Center(
                          child: Container(
                              child: SvgPicture.asset(
                            "assets/icons/flutter.svg",
                            height: 40,
                            width: 40,
                            fit: BoxFit.contain,
                          )),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (c) => ClusterDisplay(
                                "Agumented Reality",
                                aboutclus.ar,
                                "assets/clusterBackground/vrBackground.jpeg"),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(
                            0xffF4B400,
                          ).withOpacity(0.25),
                        ),
                        child: Center(
                          child: Container(
                              child: SvgPicture.asset(
                            "assets/icons/ar.svg",
                            height: 40,
                            width: 40,
                            fit: BoxFit.contain,
                          )),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (c) => ClusterDisplay(
                                "Google Cloud Platform",
                                aboutclus.gcp,
                                "assets/clusterBackground/gcpBackground.png"),
                          ),
                        );
                      },
                      child: Cluster("assets/icons/cloud.svg", 0xff0F9D58),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (c) => ClusterDisplay(
                                  "Machine Learning",
                                  aboutclus.machinelearning,
                                  "assets/clusterBackground/mlBackground.png"),
                            ),
                          );
                        },
                        child:
                            Cluster("assets/clusters/setting.svg", 0xff4285F4)),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(
                          0xff4285F4,
                        ).withOpacity(0.25),
                      ),
                      child: Center(
                        child: Container(
                            child: SvgPicture.asset(
                          "assets/clusters/report.svg",
                          height: 40,
                          width: 40,
                          fit: BoxFit.contain,
                        )),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(
                          0xff0F9D58,
                        ).withOpacity(0.25),
                      ),
                      child: Center(
                        child: Container(
                            child: SvgPicture.asset(
                          "assets/clusters/article.svg",
                          height: 40,
                          width: 40,
                          fit: BoxFit.contain,
                        )),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(
                          0xff4285F4,
                        ).withOpacity(0.25),
                      ),
                      child: Center(
                        child: Container(
                            child: SvgPicture.asset(
                          "assets/clusters/tools.svg",
                          height: 40,
                          width: 40,
                          fit: BoxFit.contain,
                        )),
                      ),
                    ),
                    Cluster("assets/icons/pen.svg", 0xff0F9D58)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: h * 0.3,
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/backgroud.jpg"),
                  fit: BoxFit.fill,
                  colorFilter:
                      ColorFilter.mode(Colors.black54, BlendMode.srcATop),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 64,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    // margin: const EdgeInsets.symmetric(
                    //   vertical: 16,
                    //   horizontal: 8,
                    // ),
                    decoration: BoxDecoration(
                      // color: Colors.transparent,

                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Image.asset(
                      "assets/dsc sastra.png",
                      // height: w * 0.05,
                      // width: w * 0.5,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  // Text(
                  //   "Developers Student Club",
                  //   style: TextStyle(
                  //       fontSize: 24,
                  //       color: Colors.white,
                  //       fontWeight: FontWeight.w500),
                  // )
                ],
              ),
            ),
            ...drawerItems,
            Expanded(child: Container()),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      color: Colors.black45,
                      height: 2,
                      width: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0, left: 5),
                      child: Text("Connect",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                    Container(
                      color: Colors.black45,
                      height: 2,
                      width: 30,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        _linkedinURL();
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        // color: Colors.green,
                        child: SvgPicture.asset(
                          "assets/linkedin.svg",
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _mediumURL();
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        child: SvgPicture.asset(
                          "assets/medium.svg",
                          color: Colors.black,
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        _instaURL();
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        child: SvgPicture.asset(
                          "assets/instagram.svg",
                          // color: Colors.redAccent,
                        ),
                      ),
                    ),
                    // Image.asset("assets/logo.png")
                  ],
                )
              ],
            ),
            Container(height: h * 0.05),
          ],
        ),
      ),
    );
  }
}

class Cluster extends StatelessWidget {
  String icon;
  int color;
  Cluster(String icon, int color) {
    this.icon = icon;
    this.color = color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(
          color,
        ).withOpacity(0.25),
      ),
      child: Center(
        child: Container(
            child: SvgPicture.asset(
          icon,
          // height: 10,
          // width: 10,
          fit: BoxFit.contain,
        )),
      ),
    );
  }
}

class Recent extends StatelessWidget {
  String poster;
  Recent(this.poster);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage(poster), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                offset: Offset(0, 4),
                color: Colors.black.withOpacity(0.25))
          ]),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      // width: 100,
    );
  }
}

_mediumURL() async {
  const url = 'https://medium.com/@dsc.sastra.university';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_linkedinURL() async {
  const url = 'https://www.linkedin.com/company/dsc-sastra/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_instaURL() async {
  const url = 'https://www.instagram.com/dsc_sastra_university/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

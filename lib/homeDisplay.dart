import 'package:after_layout/after_layout.dart';
import 'package:dsc_sastra_university/utility/utils.dart';
import 'package:dsc_sastra_university/widgets/drawer.dart';
import 'package:dsc_sastra_university/widgets/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'api/aboutCluster.dart';
import 'api/env.dart';
import 'api/eventApi.dart';
import 'clusterDisplay.dart';

List<DrawerItem> drawerItems = [
  DrawerItem("Home", "/home", Icons.home),
  DrawerItem("Events", "/events", Icons.event),
  DrawerItem(
    "Team",
    "/team",
    Icons.group,
  ),
  DrawerItem("Resources", "/resources", Icons.bookmark_border),
  DrawerItem("About Us", "/aboutus", Icons.info),
];

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin {
  var aboutCluster = new AboutCluster();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  int c = 0;
  double screenWidth, screenHeight;

  List<Widget> recents = [];
  List<Widget> upcomingEvents = [];

  bool isLoaded = false;

  @override
  void afterFirstLayout(BuildContext context) async {
    DateTime nowDateTime = DateTime.now();

    List<EventPODO> eventList = (await EventApi.getEvents());

    for (EventPODO event in eventList) {
      ZeshEvent widget = ZeshEvent(event, heroTag: true);
      if (nowDateTime.compareTo(event.date) == -1)
        upcomingEvents.add(widget);
      else
        recents.add(widget);
    }
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: FlatButton.icon(
            icon: Image.asset(
              "assets/logo.png",
              width: screenWidth * 0.1,
              height: screenHeight * 0.042,
            ),
            label: Text(
              appBarTitleHomePage,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            disabledTextColor: Colors.black,
            onPressed: () => Navigator.of(context).popAndPushNamed("/"),
          ),
          /* actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: choiceAction,
              itemBuilder: (BuildContext context){
                return Constants.choices.map((String choice){
                  return PopupMenuItem(
                    value: choice,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.share),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(choice),
                        )
                      ],
                    ),
                  );
                }).toList();
              },
            ),
          ],*/
          centerTitle: true,
        ),
        drawer: buildDrawer(),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //Upcoming Events Widget
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //Upcoming Events
                    Padding(
                      padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
                      child: Text(
                        "Upcoming",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),

                    Container(
                      height: upcomingEvents.length == 0
                          ? screenHeight * 0.15
                          : screenHeight * 0.3,
                      child: upcomingEvents.length == 0
                          ? showEmptyPlaceHolder(isLoaded)
                          : showEventsList(isLoaded, upcomingEvents),
                    )
                  ],
                ),

                //Recent Events Widget
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //Upcoming Events

                    Padding(
                      padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
                      child: Text(
                        "Recent",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),

                    Container(
                      height: recents.length == 0
                          ? screenHeight * 0.15
                          : screenHeight * 0.2,
                      child: recents.length == 0
                          ? showEmptyPlaceHolder(isLoaded)
                          : showEventsList(isLoaded, recents),
                    )
                  ],
                ),

                // Clusters Widget
                Padding(
                  padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
                  child: Text(
                    "Clusters",
                    style: TextStyle(fontSize: 24),
                  ),
                ),

                Container(
                  height: screenHeight * 0.75,
                  child: GridView.count(
                    crossAxisCount: 3,
                    physics: NeverScrollableScrollPhysics(),
                    childAspectRatio: 1,
                    padding: EdgeInsets.only(
                        left: 32, top: 8, bottom: 16, right: 32),
                    mainAxisSpacing: 32,
                    crossAxisSpacing: 32,
                    children: <Widget>[
                      displayClusterIcon(
                          context,
                          ClusterDisplay(
                              "App Development",
                              aboutCluster.android,
                              "assets/clusterBackground/appdy.jpg"),
                          Cluster("assets/icons/android-logo.svg", 0xff0F9D58)),
                      displayClusterIcon(
                          context,
                          ClusterDisplay("Web Devlopment", aboutCluster.web,
                              "assets/clusterBackground/wedy.jpg"),
                          Cluster("assets/icons/web-programming (1).svg",
                              0xffDB4437)),
                      displaySVGClusterIcon(
                          context,
                          ClusterDisplay("Flutter", aboutCluster.flutter,
                              "assets/clusterBackground/flutterBackground.png"),
                          0xff4285F4,
                          "assets/icons/flutter.svg"),
                      displaySVGClusterIcon(
                          context,
                          ClusterDisplay("Agumented Reality", aboutCluster.ar,
                              "assets/clusterBackground/vrBackground.jpeg"),
                          0xffF4B400,
                          "assets/icons/ar.svg"),
                      displayClusterIcon(
                          context,
                          ClusterDisplay(
                              "Google Cloud Platform",
                              aboutCluster.gcp,
                              "assets/clusterBackground/gcpBackground.png"),
                          Cluster("assets/icons/cloud.svg", 0xff0F9D58)),
                      displayClusterIcon(
                          context,
                          ClusterDisplay(
                              "Machine Learning",
                              aboutCluster.machinelearning,
                              "assets/clusterBackground/mlBackground.png"),
                          Cluster("assets/icons/ml.svg", 0xff4285F4)),
                      displaySVGClusterIcon(
                          context,
                          ClusterDisplay(
                              "Graphic Designing",
                              aboutCluster.graphicDesigning,
                              "assets/clusterBackground/design_background.png"),
                          0xff0F9D58,
                          "assets/icons/designing.svg"),
                      displaySVGClusterIcon(
                          context,
                          ClusterDisplay("Marketing", aboutCluster.marketing,
                              "assets/eventsStudents.jpg"),
                          0xff4285F4,
                          "assets/icons/report.svg"),
                      displaySVGClusterIcon(
                          context,
                          ClusterDisplay(
                              "Event Coverage",
                              aboutCluster.eventCoverage,
                              "assets/eventsStudents.jpg"),
                          0xff4285F4,
                          "assets/icons/article.svg"),
                      displaySVGClusterIcon(
                          context,
                          ClusterDisplay(
                              "Content writing",
                              aboutCluster.contentWriting,
                              "assets/eventsStudents.jpg"),
                          0xff0F9D58,
                          "assets/icons/pen.svg"),
                    ],
                  ),
                )
              ],
            ),
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
              height: screenHeight * 0.3,
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
                      padding: const EdgeInsets.only(right: 5, left: 5),
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
                        launchURL(dscSASTRALinkedInURL);
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
                        launchURL(dscSASTRAMediumURL);
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
                        launchURL(dscSASTRAInstaURL);
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
            Container(height: screenHeight * 0.05),
          ],
        ),
      ),
    );
  }
}
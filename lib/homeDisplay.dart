import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:after_layout/after_layout.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dsc_sastra_university/utility/utils.dart';
import 'package:dsc_sastra_university/widgets/drawer.dart';
import 'package:dsc_sastra_university/widgets/home.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

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

delayedFunc(int i, BuildContext context) {
  print("Started $i!");
  Future.delayed(Duration(seconds: i), () {
    showDialog(
        context: context,
        builder: (ctx) {
          print("Here we are $i !!");
          return AssetGiffyDialog(
            image: Image.asset(
              "assets/rate.gif",
              fit: BoxFit.fill,
            ),
            title: Text("Mind rating our app ?"),
            description: Text("Help us to make our app better"),
            buttonOkColor: Colors.blue,
            onOkButtonPressed: () {
              launchURL(
                  "https://play.google.com/store/apps/details?id=dsc.sastra.dsc_sastra_university");
              Navigator.pop(context);
            },
            onCancelButtonPressed: () {
              Navigator.of(context).pop();
              delayedFunc(i * 2, context);
            },
          );
          // return AlertDialog(
          //   // contentPadding: EdgeInsets.all(28),
          //   shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(12.0)),
          //   title: Text("Please support us"),
          //   content: Text("Would you consider rating our app ?"),
          //   actions: <Widget>[
          //     Padding(
          //       padding: const EdgeInsets.all(18.0),
          //       child: FlatButton(
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(18.0),
          //         ),
          //         onPressed: () {
          //           Navigator.of(context).pop();
          //           delayedFunc((i * 1.5).floor(), context);
          //         },
          //         child: Text("No"),
          //       ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: RaisedButton(
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(8.0),
          //         ),
          //         onPressed: () {
          //           launchURL(
          //               "https://play.google.com/store/apps/details?id=dsc.sastra.dsc_sastra_university");
          //           Navigator.pop(context);
          //         },
          //         color: Colors.blue,
          //         child: Text("Yes"),
          //       ),
          //     ),
          //   ],
          // );
        });
  });
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin {
  var aboutCluster = new AboutCluster();

  @override
  void initState() {
    delayedFunc(15, context);
    super.initState();
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  int c = 0;
  double screenWidth, screenHeight;

  List<Widget> recents = [];
  List<Widget> upcomingEvents = [];

  bool isLoaded = false;

  @override
  void afterFirstLayout(BuildContext context) async {
    // isLoaded =
    //     (await Connectivity().checkConnectivity()) == ConnectivityResult.none;
    // subscription = Connectivity()
    //     .onConnectivityChanged
    //     .listen((ConnectivityResult result) {
    //   if (result != ConnectivityResult.none) {
    //     setState(() {
    //       isLoaded = true;
    //     });
    //   } else
    //     setState(() {
    //       isLoaded = false;
    //     });
    // });
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

  var subscription;

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          actions: <Widget>[
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AssetGiffyDialog(
                    description: Text("Cause sharing is caring"),
                    image: Image.asset(
                      "assets/DSC.gif",
                      fit: BoxFit.fitWidth,
                    ),
                    title: Text(
                      "Mind sharing our app ?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    buttonOkColor: Colors.blue,
                    onOkButtonPressed: () {
                      // var request = await HttpClient().getUrl(
                      //   Uri.parse(
                      //     "https://dscmescoe.com/images/DSC-Mescoe.gif",
                      //   ),
                      // );
                      // var response = await request.close();
                      // Uint8List bytes =
                      //     await consolidateHttpClientResponseBytes(response);
                      Share.text(
                          "DSC SASTRA University",
                          "*DSC SASTRA University*\n\nDownload our app show your support:\nhttps://play.google.com/store/apps/details?id=dsc.sastra.dsc_sastra_university\n\nVisit us at http://dsc.sastratbi.in/\n\n*Follow us on:*\n\nInstagram\nhttps://www.instagram.com/dsc_sastra_university/\n\nLinkedIn\nhttps://www.linkedin.com/in/dsc-sastra/",
                          // bytes,
                          "text/plain");
                      Navigator.pop(context);
                    },
                    onCancelButtonPressed: () => Navigator.pop(context),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(right: 12),
                child: Icon(Icons.more_vert),
              ),
            ),
          ],
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

                    buildUpcoming()
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
                          Cluster("assets/icons/webdy.svg", 0xffDB4437)),
                      displaySVGClusterIcon(
                          context,
                          ClusterDisplay("Flutter", aboutCluster.flutter,
                              "assets/clusterBackground/flutterBackground.png"),
                          0xff4285F4,
                          "assets/icons/flutter.svg"),
                      displaySVGClusterIcon(
                          context,
                          ClusterDisplay("Augmented Reality", aboutCluster.ar,
                              "assets/clusterBackground/vrBackground.jpeg"),
                          0xffF4B400,
                          "assets/icons/vr.svg"),
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

  Container buildUpcoming() {
    return Container(
      height:
          upcomingEvents.length == 0 ? screenHeight * 0.15 : screenHeight * 0.3,
      child: upcomingEvents.length == 0
          ? showEmptyPlaceHolder(isLoaded)
          : showEventsList(isLoaded, upcomingEvents),
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
                      "assets/dscsastra.png",
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
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: drawerItems,
              ),
            ),
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

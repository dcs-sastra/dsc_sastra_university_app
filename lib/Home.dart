import 'package:dsc_sastra_university/cluster.dart';
import 'package:dsc_sastra_university/eventDisplay.dart';
import 'package:dsc_sastra_university/pages/aboutMember.dart';
import 'package:dsc_sastra_university/pages/aboutus.dart';
import 'package:dsc_sastra_university/pages/event.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class DrawerItem extends StatelessWidget {
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
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  int c = 0;
  double w, h;

  @override
  Widget build(BuildContext context) {
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
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
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
                                    builder: (c) =>
                                        Event("Google cloud platform")));
                              },
                              child: Recent("assets/flutter.jpg")),
                          Recent("assets/events.jpg"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 32, top: 16, bottom: 16),
                child: Text(
                  "Cluster",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Container(
                height: h * 0.5,
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
                              builder: (c) => ClusterDisplay("App Devlopment"),
                            ),
                          );
                        },
                        child: Cluster(
                            "assets/icons/android-logo.svg", 0xff0F9D58)),
                    Cluster("assets/icons/web-programming (1).svg", 0xffDB4437),
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
                          "assets/icons/flutter.svg",
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
                    Cluster(
                        "assets/icons/artificial-intelligence.svg", 0xff0F9D58),
                    Cluster("assets/icons/pen.svg", 0xffDB4437),
                  ],
                ),
              ),
              Container(
                height: 150,
                width: double.infinity,
                // color: Colors.orange,
              )
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
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(
                      "assets/logo.png",
                      height: h * 0.05,
                      width: h * 0.05,
                    ),
                  ),
                  Text(
                    "DSC",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Developers Student Club",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  )
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
                    Container(
                      height: 40,
                      width: 40,
                      // color: Colors.green,
                      child: SvgPicture.asset(
                        "assets/linkedin.svg",
                        color: Colors.blue,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      child: SvgPicture.asset(
                        "assets/twitter.svg",
                        color: Colors.blue,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      child: SvgPicture.asset(
                        "assets/instagram.svg",
                        // color: Colors.redAccent,
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
      width: 100,
    );
  }
}

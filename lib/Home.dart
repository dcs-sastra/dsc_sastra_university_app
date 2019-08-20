import 'package:dsc_sastra_university/event.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  bool tochedhome = false;
  bool tochedevent = false;
  bool tochedgal = false;
  bool tochedcore = false;
  bool tochedabt = false;

  int c = 0;
  double w, h;

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/backgroud.jpg"),
                      fit: BoxFit.fill),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 64, left: 32),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 64,
                        width: 64,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(64)),
                        child: Image.asset(
                          "",
                          height: 64,
                          width: 64,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Ashwin Ram",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: "ProductSans",
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "ramashwin36@gmail.com",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: "ProductSans",
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10, top: 16),
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          tochedhome = !tochedhome;
                          tochedevent =
                              tochedgal = tochedabt = tochedcore = false;
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: tochedhome == true
                                ? Colors.lightBlueAccent.withOpacity(.2)
                                : Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(32),
                                bottomRight: Radius.circular(32))),
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 32),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.home,
                                color: tochedhome == true
                                    ? Colors.blue
                                    : Colors.blueGrey,
                                size: 26,
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              Text(
                                "Home",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "ProductSans",
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          tochedgal = !tochedgal;
                          tochedevent =
                              tochedhome = tochedabt = tochedcore = false;
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: tochedgal == true
                                ? Colors.lightBlueAccent
                                : Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(32),
                                bottomRight: Radius.circular(32))),
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 32),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.contacts,
                                color: tochedgal == true
                                    ? Colors.blue
                                    : Colors.blueGrey,
                                size: 26,
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              Text(
                                "Gallery",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "ProductSans",
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          tochedevent = !tochedevent;
                          tochedhome =
                              tochedgal = tochedabt = tochedcore = false;
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: tochedevent == true
                                ? Colors.lightBlueAccent
                                : Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(32),
                                bottomRight: Radius.circular(32))),
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 32),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.home,
                                color: tochedevent == true
                                    ? Colors.blue
                                    : Colors.blueGrey,
                                size: 26,
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              Text(
                                "Events",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "ProductSans",
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          tochedcore = !tochedcore;
                          tochedevent =
                              tochedgal = tochedabt = tochedhome = false;
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: tochedcore == true
                                ? Colors.lightBlueAccent
                                : Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(32),
                                bottomRight: Radius.circular(32))),
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 32),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.home,
                                color: tochedcore == true
                                    ? Colors.blue
                                    : Colors.blueGrey,
                                size: 26,
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              Text(
                                "Core members",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "ProductSans",
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          tochedabt = !tochedabt;
                          tochedevent =
                              tochedgal = tochedhome = tochedcore = false;
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: tochedabt == true
                                ? Colors.lightBlueAccent
                                : Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(32),
                                bottomRight: Radius.circular(32))),
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 32),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.home,
                                color: tochedabt == true
                                    ? Colors.blue
                                    : Colors.blueGrey,
                                size: 26,
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              Text(
                                "About Us",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "ProductSans",
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 130,
              ),
              Center(
                child: Container(
                  height: 110,
                  width: 200,
                  // color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
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
                              padding:
                                  const EdgeInsets.only(right: 5.0, left: 5),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                        child: Icon(Icons.menu, color: Colors.black),
                        onTap: () {
                          _scaffoldKey.currentState.openDrawer();
                        }),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                          // color: Colors.white,
                          height: 50,
                          width: 50,
                          child: Image.asset("assets/logo.png")),
                      SizedBox(
                        width: 10,
                      ),
                      Text("DSC SASTRA",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontStyle: FontStyle.italic)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.settings, color: Colors.black),
                  )
                ],
              ),
              Container(
                height: 300,
                width: double.infinity,
                // color: Colors.green,
                child: Column(
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
                      height: 200,
                      child: PageView(
                        controller: PageController(viewportFraction: 0.8),
                        scrollDirection: Axis.horizontal,
                        pageSnapping: true,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        ExactAssetImage("assets/flutter.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                      color: Colors.black.withOpacity(0.25))
                                ]),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            // child: Image.asset("assets/flutter.jpg"),
                            // color: Colors.white,
                            width: 100,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: Image.asset("assets/studyjam.jpg"),
                            color: Colors.blueAccent,
                            width: 100,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            color: Colors.greenAccent,
                            width: 100,
                          ),
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
                height: 250,
                width: double.infinity,
                // color: Colors.redAccent,
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  padding: EdgeInsets.only(left: 32, right: 32, top: 16),
                  mainAxisSpacing: 32,
                  crossAxisSpacing: 32,
                  children: <Widget>[
                    Cluster("assets/icons/android-logo.svg", 0xff0F9D58),
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

//  Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Padding(
//                       padding: EdgeInsets.only(left: 32, top: 16, bottom: 16),
//                       child: Text(
//                         "Cluster",
//                         style: TextStyle(fontSize: 24),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: 32),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Container(
//                             decoration: BoxDecoration(

//                                 // boxShadow: [
//                                 //   BoxShadow(color: Colors.black,
//                                 //   blurRadius: 20)
//                                 // ],
//                                 // color: Colors.pink,
//                                 image: DecorationImage(
//                                     image: ExactAssetImage(
//                                         "assets/FlutterIcon.png"),
//                                     fit: BoxFit.cover),
//                                 borderRadius: BorderRadius.circular(10)),
//                             height: 75,
//                             width: 75,
//                           ),
//                           SizedBox(
//                             width: 20,
//                           ),
//                           Container(
//                             decoration: BoxDecoration(

//                                 // color: Colors.pink,
//                                 image: DecorationImage(
//                                     image: ExactAssetImage(
//                                         "assets/Android-Icon.png"),
//                                     fit: BoxFit.cover),
//                                 borderRadius: BorderRadius.circular(10)),
//                             height: 75,
//                             width: 75,
//                           ),
//                           SizedBox(
//                             width: 20,
//                           ),
//                           Container(
//                             height: 75,
//                             width: 75,
//                             decoration: BoxDecoration(

//                                 // color: Colors.pink,
//                                 image: DecorationImage(
//                                     image: ExactAssetImage("assets/ar.jpg"),
//                                     fit: BoxFit.cover),
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           SizedBox(
//                             width: 20,
//                           ),
//                           Container(
//                             height: 75,
//                             width: 75,
//                             decoration: BoxDecoration(

//                                 // color: Colors.pink,
//                                 image: DecorationImage(
//                                     image: ExactAssetImage(
//                                         "assets/contentWriting.png"),
//                                     fit: BoxFit.cover),
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 16,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: 32),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Container(
//                             decoration: BoxDecoration(
//                                 // color: Colors.pink,
//                                 image: DecorationImage(
//                                     image: ExactAssetImage(
//                                         "assets/web-development.png"),
//                                     fit: BoxFit.cover),
//                                 borderRadius: BorderRadius.circular(10)),
//                             height: 75,
//                             width: 75,
//                           ),
//                           SizedBox(
//                             width: 20,
//                           ),
//                           Container(
//                             height: 75,
//                             width: 75,
//                             decoration: BoxDecoration(
//                                 // color: Colors.pink,
//                                 image: DecorationImage(
//                                     image: ExactAssetImage("assets/ml.png"),
//                                     fit: BoxFit.cover),
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                           SizedBox(
//                             width: 20,
//                           ),
//                           Container(
//                             height: 75,
//                             width: 75,
//                             color: Colors.pink,
//                           ),
//                           SizedBox(
//                             width: 20,
//                           ),
//                           Container(
//                             height: 75,
//                             width: 75,
//                             color: Colors.pink,
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),

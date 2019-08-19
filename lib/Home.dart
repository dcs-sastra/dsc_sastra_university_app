import 'package:dsc_sastra_university/event.dart';
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
  double w, h;

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: 250,
              width: double.infinity,
              // color: Colors.blueGrey,
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
                        "studyjam.png",
                        height: 64,
                        width: 64,
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      "Ashwin Ram",
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "ramashwin36@gmail.com",
                      style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 20,
              color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.only(left: 32, right: 10, top: 10),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tochedhome = !tochedhome;
                        tochedevent = false;
                      });
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: tochedhome == true
                              ? Colors.lightBlueAccent
                              : Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      height: 40,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.home,
                            color: tochedhome == true
                                ? Colors.blue
                                : Colors.blueGrey,
                            size: 32,
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          Text(
                            "Home",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color: Colors.blueGrey,
                          size: 32,
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Text(
                          "Gallery",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tochedevent = !tochedevent;
                        tochedhome = false;
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Event()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: tochedevent == true
                              ? Colors.lightBlueAccent
                              : Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      height: 40,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.home,
                            color: tochedevent == true
                                ? Colors.blue
                                : Colors.blueGrey,
                            size: 32,
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          Text(
                            "Events",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color: Colors.blueGrey,
                          size: 32,
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Text(
                          "Cluster",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color: Colors.blueGrey,
                          size: 32,
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Text(
                          "Core team",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color: Colors.blueGrey,
                          size: 32,
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Text(
                          "Contact Us",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color: Colors.blueGrey,
                          size: 32,
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Text(
                          "About",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
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
                color: Colors.green,
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
                child: SvgPicture.asset(
                  "assets/Freesample.svg",
                  height: 32,
                  width: 32,
                ),
                height: 75,
                width: 75,
              ),
              Container(
                height: 250,
                width: double.infinity,

                // color: Colors.redAccent,
                child: GridView.count(
                  crossAxisCount: 3,
                  children: <Widget>[],
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

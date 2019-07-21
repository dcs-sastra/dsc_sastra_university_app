import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  bool toched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer:  Drawer(
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
                                            borderRadius:
                                                BorderRadius.circular(64)),
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
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.blueGrey),
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
                                padding:
                                    EdgeInsets.only(left: 32, right: 10, top: 10),
                                child: Column(
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          toched = !toched;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: toched == true
                                                ? Colors.lightBlueAccent
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        height: 40,
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.home,
                                              color: toched == true
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
                                            "Events",
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
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                      child: Icon(Icons.menu, color: Colors.black),
                      onTap: () {
                        _scaffoldKey.currentState.openDrawer();
                       
                      }),
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
                  Icon(Icons.settings, color: Colors.black)
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
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: Image.asset("assets/flutter.jpg"),
                            color: Colors.white,
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
              Container(
                height: 250,
                width: double.infinity,
                color: Colors.redAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 32, top: 16, bottom: 16),
                      child: Text(
                        "Cluster",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 32),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 75,
                            width: 75,
                            color: Colors.pink,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 75,
                            width: 75,
                            color: Colors.pink,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 75,
                            width: 75,
                            color: Colors.pink,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 75,
                            width: 75,
                            color: Colors.pink,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 32),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 75,
                            width: 75,
                            color: Colors.pink,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 75,
                            width: 75,
                            color: Colors.pink,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 75,
                            width: 75,
                            color: Colors.pink,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 75,
                            width: 75,
                            color: Colors.pink,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 150,
                width: double.infinity,
                color: Colors.orange,
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:dsc_sastra_university/gallery.dart';
import 'package:flutter/material.dart';

class ClusterDisplay extends StatefulWidget {
  String clubname;
  ClusterDisplay(clubname) {
    this.clubname = clubname;
  }

  _ClusterDisplayState createState() => _ClusterDisplayState();
}

class _ClusterDisplayState extends State<ClusterDisplay> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              iconTheme: IconThemeData(color: Colors.grey),
              backgroundColor: Colors.white,
              // title:Text(widget.clubname) ,
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  
                  title: Text(widget.clubname,
                      style: TextStyle(
                        color:  Colors.black,
                        fontSize: 16.0,
                      )),
                  background: Image.asset(
                    "assets/ar.jpg",
                    fit: BoxFit.cover,
                    
                  )),
            ),
          ];
        },
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "About",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: "ProductSans",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "          Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recentl",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, top: 16, bottom: 16),
                      child: Text(
                        "Gallery",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "ProductSans",
                        ),
                      ),
                    ),
                    Container(
                      child: Gallery(),
                      height: 250,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, top: 16),
                      child: Text(
                        "Members",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "ProductSans",
                        ),
                      ),
                    ),
                    Container(
                      height: w * 0.4,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          10,
                          (i) => Container(
                            width: w * 0.3,
                            height: double.maxFinite,
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  height: w * 0.2,
                                  width: w * 0.2,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage("assets/ar.jpg"),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text("Sibi N", style: TextStyle(fontSize: 16))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

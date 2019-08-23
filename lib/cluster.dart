import 'package:dsc_sastra_university/gallery.dart';

import 'package:flutter/material.dart';

class ClusterDisplay extends StatefulWidget {
  String clubname, about, background;
  ClusterDisplay(clubname, about, background) {
    this.clubname = clubname;
    this.about = about;
    this.background = background;
  }

  _ClusterDisplayState createState() => _ClusterDisplayState();
}

class _ClusterDisplayState extends State<ClusterDisplay> {
  Color color = Colors.white;
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(() {
      setState(() {
        color = Color.lerp(
            Colors.white, Colors.black, scrollController.position.pixels / 200);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String about = widget.about;

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              iconTheme: IconThemeData(color: Colors.grey),
              backgroundColor: Colors.white,
              title: Text(
                widget.clubname,
                style: TextStyle(color: color),
              ),
              expandedHeight: w * 0.5,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                // title: Text("",
                //     style: TextStyle(
                //       color: Colors.black,
                //       fontSize: 16.0,
                //     )),
                background: Image.asset(
                  widget.background,
                  fit: BoxFit.cover,
                  // color: Colors.white54,
                  colorBlendMode: BlendMode.srcATop,
                ),
              ),
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
                        "\t $about",
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
                      height: w * 0.7,
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

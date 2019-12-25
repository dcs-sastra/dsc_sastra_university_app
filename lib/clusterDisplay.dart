import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'api/clusterApi.dart';

class ClusterDisplay extends StatefulWidget {
  String clubName, about, background;

  ClusterDisplay(clubName, about, background) {
    this.clubName = clubName;
    this.about = about;
    this.background = background;
  }

  _ClusterDisplayState createState() => _ClusterDisplayState();
}

class _ClusterDisplayState extends State<ClusterDisplay> {
  Color color = Colors.white;
  ScrollController scrollController = ScrollController();
  List<ClusterGallery> clusterGallery;

  @override
  void initState() {

    clusterGallery = ClusterApi.getClusterGallery()[widget.clubName];
    print("Gallery len");
    print(clusterGallery.length);

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

    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: NestedScrollView(
            controller: scrollController,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  iconTheme: IconThemeData(color: Colors.black),
                  backgroundColor: Colors.white,
                  title: Text(
                    widget.clubName,
                    style: TextStyle(color: color),
                  ),
                  expandedHeight: screenWidth * 0.5,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      widget.background,
                      fit: BoxFit.cover,
                      colorBlendMode: BlendMode.srcATop,
                    ),
                  ),
                )
              ];
            },
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "About",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ProductSans"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "\t $about",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        ExpansionTile(
                          initiallyExpanded: false,
                          subtitle: Text("Click to expand"),
                          children: List.generate(
                            clusterGallery.length,
                            (i) {
                              return Container(
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 8,
                                      offset: Offset(0, 4),
                                      color: Colors.black.withOpacity(0.25),
                                    )
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image(
                                    image: CachedNetworkImageProvider(
                                        clusterGallery[i].url
                                    ),
                                  )
                                ),
                              );
                            },
                          ),
                          title: Text(
                            "Gallery",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ProductSans",
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(left: 8, top: 16, bottom: 16),
                        //   child: Text(
                        //     "Gallery",
                        //     style: TextStyle(
                        //       fontSize: 20,
                        //       fontWeight: FontWeight.bold,
                        //       fontFamily: "ProductSans",
                        //     ),
                        //   ),
                        // ),
                        // Container(
                        //   child: Gallery(),
                        //   height: screenWidth,
                        // )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

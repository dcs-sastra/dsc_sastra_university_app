import 'package:dsc_sastra_university/gallery.dart';
import 'package:flutter/material.dart';

class Event extends StatefulWidget {
  String clubname;
  Event(clubname) {
    this.clubname = clubname;
  }

  _EventState createState() => _EventState();
}

class _EventState extends State<Event> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("Collapsing Toolbar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: Image.asset(
                      "assets/ar.jpg",
                      fit: BoxFit.cover,
                    )),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("About", style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "ProductSans",
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recentl",style: TextStyle(fontSize: 16),),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text("Gallery"),
                ),
                Container(
                  child: Gallery(),
                  height: 250,
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
          )),
    );
  }
}

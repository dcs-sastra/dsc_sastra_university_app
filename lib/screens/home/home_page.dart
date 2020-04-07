import 'package:flutter/material.dart';

import 'package:app/constants.dart';
import 'widgets/upcoming_event_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthBy3 = MediaQuery.of(context).size.width / 3;
    return Scaffold(
      drawer: buildDrawer(),
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                size24Box,
                Padding(
                  padding: edgeInsets24Horizontal,
                  child: Text(
                    'Upcoming Events',
                    style: textStyleSize24Bold,
                  ),
                ),
                size24Box,
                Container(
                  height: 256,
                  child: PageView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      UpcomingEventCard(
                        title: 'Basics of Photoshop',
                        imageUrl: 'assets/temp.jpg',
                        docId: '',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: edgeInsets24Horizontal,
                  child: Text(
                    'Recent',
                    style: textStyleSize24Bold,
                  ),
                ),
                size24Box,
                Container(
                  height: 128,
                  child: PageView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      UpcomingEventCard(
                        title: 'Basics of Flutter',
                        imageUrl: 'assets/temp.jpg',
                        docId: '',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  height: widthBy3,
                  width: widthBy3,
                  padding: const EdgeInsets.all(24),
                  child: Container(
                    color: Colors.black,
                  ),
                ),
                Container(
                  height: widthBy3,
                  width: widthBy3,
                  padding: const EdgeInsets.all(24),
                  child: Container(
                    color: Colors.black,
                  ),
                ),
                Container(
                  height: widthBy3,
                  width: widthBy3,
                  padding: const EdgeInsets.all(24),
                  child: Container(
                    color: Colors.black,
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  height: widthBy3,
                  width: widthBy3,
                  padding: const EdgeInsets.all(24),
                  child: Container(
                    color: Colors.black,
                  ),
                ),
                Container(
                  height: widthBy3,
                  width: widthBy3,
                  padding: const EdgeInsets.all(24),
                  child: Container(
                    color: Colors.black,
                  ),
                ),
                Container(
                  height: widthBy3,
                  width: widthBy3,
                  padding: const EdgeInsets.all(24),
                  child: Container(
                    color: Colors.black,
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  height: widthBy3,
                  width: widthBy3,
                  padding: const EdgeInsets.all(24),
                  child: Container(
                    color: Colors.black,
                  ),
                ),
                Container(
                  height: widthBy3,
                  width: widthBy3,
                  padding: const EdgeInsets.all(24),
                  child: Container(
                    color: Colors.black,
                  ),
                ),
                Container(
                  height: widthBy3,
                  width: widthBy3,
                  padding: const EdgeInsets.all(24),
                  child: Container(
                    color: Colors.black,
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  height: widthBy3,
                  width: widthBy3,
                  padding: const EdgeInsets.all(24),
                  child: Container(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            'assets/logo.png',
            width: 40,
          ),
          SizedBox(width: 16),
          Text('DSC SASTRA'),
        ],
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert),
        ),
      ],
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: Container(),
    );
  }
}

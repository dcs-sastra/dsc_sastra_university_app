import 'package:after_layout/after_layout.dart';
import 'package:app/models/event_model.dart';
import 'package:app/models/user_model.dart';
import 'package:app/screens/home/widgets/news_card.dart';
import 'package:app/screens/paginator.dart';
import 'package:app/services/auth.dart';
import 'package:app/services/database/event_collection.dart';
import 'package:app/services/database/news_collection.dart';
import 'package:flutter/material.dart';

import 'package:app/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../paginator_list.dart';
import 'widgets/upcoming_event_card.dart';
import 'widgets/cluster_buttons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin {
  double widthBy3;
  Color color, inverseColor;

  UserModel userModel;

  @override
  void initState() {
    userModel = UserModel();
    super.initState();
  }

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    userModel = await AuthService().getCachedUser();
    setState(() {
      userModel = userModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    widthBy3 = MediaQuery.of(context).size.width / 3;
    color = getColor(context);
    inverseColor = getInverseColor(context);
    return Scaffold(
      drawer: buildDrawer(),
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                size24Box,
                buildTitle(context, 'News'),
                size24Box,
                buildNews(),
                size24Box,
                buildTitle(context, 'Upcoming Events'),
                size24Box,
                buildUpcomingEvents(),
                buildTitle(context, 'Recent'),
                size24Box,
                buildRecents(),
                Padding(
                  padding: edgeInsets24Horizontal,
                  child: Text(
                    'Clusters',
                    style: textStyleSize24Bold.copyWith(
                      color: getColor(context),
                    ),
                  ),
                ),
                size24Box,
                buildClusters(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildNews() {
    return Container(
      height: 128,
      child: PaginatorList<EventModel>(
        getLength: NewsCollection().getLength,
        fetch: NewsCollection().fetchNews,
        instance: EventModel(),
        builder: (EventModel event) {
          return NewsCard(event);
        },
      ),
    );
  }

  Container buildRecents() {
    return Container(
      height: 128,
      child: Paginator<EventModel>(
        fetch: EventCollection().fetchRecents,
        builder: (EventModel eventModel) {
          return EventCard(eventModel);
        },
        instance: EventModel(),
      ),
    );
  }

  Padding buildRecentButton(BuildContext context) {
    return Padding(
      padding: edgeInsets24Horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Recent',
            style: textStyleSize24Bold.copyWith(
              color: getColor(context),
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {},
            color: getColor(context),
          ),
        ],
      ),
    );
  }

  Container buildUpcomingEvents() {
    return Container(
      height: 196,
      child: Paginator<EventModel>(
          instance: EventModel(),
          fetch: EventCollection().fetchUpcomingEvents,
          builder: (EventModel eventModel) {
            return EventCard(eventModel);
          }),
    );
  }

  Padding buildTitle(
    BuildContext context,
    String title,
  ) {
    return Padding(
      padding: edgeInsets24Horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: textStyleSize24Bold.copyWith(
              color: getColor(context),
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {},
            color: getColor(context),
          )
        ],
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : Theme.of(context).primaryColorDark,
      textTheme: Theme.of(context).brightness == Brightness.light
          ? Theme.of(context)
              .copyWith(
                primaryColor: Colors.white,
                primaryColorBrightness: Brightness.light,
              )
              .textTheme
          : Theme.of(context).textTheme.copyWith(
                title: Theme.of(context).textTheme.title.copyWith(
                      color: Colors.white,
                    ),
              ),
      iconTheme: Theme.of(context).brightness == Brightness.light
          ? Theme.of(context)
              .copyWith(
                  primaryColor: Colors.white,
                  primaryColorBrightness: Brightness.light)
              .iconTheme
          : Theme.of(context).iconTheme,
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
    const divider = Divider(
      height: 2,
      color: Colors.black,
    );
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            size24Box,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                size24Box,
                ClipOval(
                  child: Image.asset(
                    'assets/avatar.jpg',
                    width: 64,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: edgeInsets24Horizontal,
                      child: Container(
                        width: 168,
                        child: Text(
                          userModel.name ?? '',
                          softWrap: false,
                          overflow: TextOverflow.fade,
                          style: textStyleSize24Bold.copyWith(
                            color: color,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: edgeInsets24Horizontal,
                      child: Container(
                        width: 168,
                        child: Text(
                          userModel.email ?? '',
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: textStyle18.copyWith(
                            fontWeight: FontWeight.normal,
                            color: color,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            size24Box,
            divider,
            size24Box,
            buildDrawerItem(
              title: 'Home',
              icon: Icons.home,
              isHome: true,
            ),
            buildDrawerItem(icon: Icons.calendar_today, title: 'Events'),
            buildDrawerItem(icon: Icons.people, title: 'Team'),
            buildDrawerItem(icon: Icons.book, title: 'Resources'),
            buildDrawerItem(icon: Icons.info, title: 'About Us'),
            Spacer(),
            buildConnectText(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(
                      'assets/li.svg',
                      height: 32,
                      width: 32,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(
                      'assets/med.svg',
                      color: color,
                      height: 32,
                      width: 32,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(
                      'assets/ig.svg',
                      height: 32,
                      width: 32,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(
                      'assets/twit.svg',
                      height: 32,
                      width: 32,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Row buildConnectText() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 64,
          height: 2,
          color: color,
        ),
        size24Box,
        Text(
          'Connect',
          style: textStyle18.copyWith(
            color: color,
            fontWeight: FontWeight.normal,
          ),
        ),
        size24Box,
        Container(
          width: 64,
          height: 2,
          color: color,
        ),
      ],
    );
  }

  Widget buildDrawerItem({
    @required IconData icon,
    @required String title,
    bool isHome = false,
  }) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        margin: EdgeInsets.only(right: 32, top: 8, bottom: 8),
        decoration: BoxDecoration(
          color:
              isHome ? Colors.blue.withOpacity(0.2) : color.withOpacity(0.025),
          borderRadius: BorderRadius.horizontal(right: Radius.circular(64)),
        ),
        child: Row(
          children: <Widget>[
            size24Box,
            Icon(
              icon,
              color: isHome ? Colors.blue : color,
            ),
            size24Box,
            Text(
              title,
              style: textStyle18.copyWith(
                fontWeight: isHome ? FontWeight.bold : FontWeight.normal,
                color: isHome ? Colors.blue : color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildClusters(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: (width / 3) * (clusters.length / 3).ceil(),
      padding: edgeInsets24Horizontal,
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        crossAxisCount: 3,
        childAspectRatio: 1,
        children: clusters.map((f) => ClusterIconButton(f)).toList(),
      ),
    );
  }
}

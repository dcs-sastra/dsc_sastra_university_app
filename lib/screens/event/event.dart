import 'package:app/models/event_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:url_launcher/url_launcher.dart';

class Event extends StatelessWidget {
  final EventModel event;

  Event(this.event, {Key key}) : super(key: key);

  Color color, inverseColor;
  @override
  Widget build(BuildContext context) {
    color = getColor(context);
    inverseColor = getInverseColor(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: inverseColor,
        textTheme: Theme.of(context).textTheme.copyWith(
              title: Theme.of(context).textTheme.title.copyWith(
                    color: color,
                  ),
            ),
        iconTheme: Theme.of(context).iconTheme.copyWith(
              color: color,
            ),
        title: Text(event.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildDateTimeVenu(
              context,
              venue: event.venue,
              dateTime: event.dateTime,
            ),
            size24Box,
            buildTag(),
            size24Box,
            buildDescription(),
            size24Box,
            buildPoster(event.img),
            size24Box,
            buildRegister(context),
            size24Box,
            Padding(
              padding: edgeInsets24Horizontal,
              child: Text(
                'Speakers',
                style: textStyleSize24Bold.copyWith(
                  color: color,
                ),
              ),
            ),
            size24Box,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 16),
                  ...event.speakers
                      .map(
                        (f) => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          child: Column(
                            children: <Widget>[
                              ClipOval(
                                child: Image.asset(
                                  'assets/avatar.jpg',
                                  height: 64,
                                ),
                              ),
                              size24Box,
                              Text(
                                f.toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                  color: color,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                      .toList(),
                  SizedBox(width: 16),
                ],
              ),
            ),
            size24Box,
          ],
        ),
      ),
    );
  }

  getMonthName(int i) {
    return {
      1: 'Jan',
      2: 'Feb',
      3: 'Mar',
      4: 'Apr',
      5: 'May',
      6: 'Jun',
      7: 'Jul',
      8: 'Aug',
      9: 'Sep',
      10: 'Oct',
      11: 'Nov',
      12: 'Dec',
    }[i];
  }

  Widget buildRegister(BuildContext context) {
    return event.link != null
        ? InkWell(
            splashColor: Colors.red,
            borderRadius: BorderRadius.horizontal(right: Radius.circular(64)),
            onTap: () {
              if (event.link.contains('/viewform?usp=pp_url'))
                _launchURL(event.link);
              else {
                FlutterWebviewPlugin webviewPlugin = FlutterWebviewPlugin();
                webviewPlugin.onUrlChanged.listen((url) {
                  print('UUUUUUUUUUUUUURRRRRRRRRRRRRLLLLLLLLLLL');
                  print(url);
                  if (url.endsWith('/formResponse')) {
                    Future.delayed(Duration(seconds: 2), () async {
                      await webviewPlugin.hide();
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Yes'),
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      webviewPlugin.show();
                                    },
                                    child: Text('No'),
                                  )
                                ],
                                title: Text('Form Submitted'),
                                content: Text(
                                  'Do you want to leave ?',
                                  strutStyle: StrutStyle(
                                    height: 1.5,
                                  ),
                                ),
                              ));
                    });
                  }
                });
                webviewPlugin.onBack.listen((_) async {
                  print('Back');
                  if (await webviewPlugin.canGoBack()) {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    webviewPlugin.close();
                                  },
                                  child: Text('Yes'),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('No'),
                                )
                              ],
                              title: Text('Form not submitted'),
                              content: Text(
                                'Do you want to leave ?',
                                strutStyle: StrutStyle(
                                  height: 1.5,
                                ),
                              ),
                            ));
                  } else
                    webviewPlugin.goBack();
                });
                webviewPlugin.launch(event.link);
              }

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => SafeArea(
                    child: WebviewScaffold(
                      url: event.link,
                    ),
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 18,
              ),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.2),
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(64),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  size24Box,
                  Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  size24Box,
                ],
              ),
            ),
          )
        : Container();
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  Padding buildPoster(String tag) {
    return Padding(
      padding: edgeInsets24Horizontal,
      child: Card(
        shape: roundedRectangleBorder8,
        child: ClipRRect(
          borderRadius: borderRadius8,
          child: Hero(
              tag: tag,
              child: CachedNetworkImage(
                placeholder: (_, __) => Center(
                  child: CircularProgressIndicator(),
                ),
                imageUrl: event.img,
              )),
        ),
      ),
    );
  }

  Widget buildDescription() {
    return event.desc != null
        ? Padding(
            padding: edgeInsets24Horizontal,
            child: Text(
              event.desc,
              style: TextStyle(
                color: color,
                wordSpacing: 1.5,
                height: 1.5,
                fontSize: 18,
              ),
            ),
          )
        : Container();
  }

  Widget buildTag() {
    return event.tag != null
        ? Padding(
            padding: edgeInsets24Horizontal,
            child: Text(
              event.tag,
              style: textStyleSize24Bold.copyWith(color: color),
            ),
          )
        : Container();
  }

  Widget buildDateTimeVenu(BuildContext context,
      {DateTime dateTime, String venue}) {
    bool dateTimeNotNull = dateTime != null;
    if ((!dateTimeNotNull) && venue == null)
      return Container();
    else
      return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Card(
          shape: roundedRectangleBorder8,
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.blue
              : Colors.blueGrey,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: <Widget>[
                if (dateTime != null) ...[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.calendar_today,
                        size: 24,
                        color: Colors.white,
                      ),
                      size24Box,
                      Text(
                        '${dateTime.day} ${getMonthName(dateTime.month)} ${dateTime.year}',
                        style: textStyle18.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  if (dateTime.hour != 0) size24Box,
                  if (dateTime.hour != 0) ...[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          size: 24,
                          color: Colors.white,
                        ),
                        size24Box,
                        Text(
                          '${dateTime.hour} - ${dateTime.minute}',
                          style: textStyle18.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ]
                ],
                if (venue != null) size24Box,
                if (venue != null)
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        size: 24,
                        color: Colors.white,
                      ),
                      size24Box,
                      Text(
                        venue,
                        style: textStyle18.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      );
  }
}

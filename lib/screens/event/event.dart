import 'package:after_layout/after_layout.dart';
import 'package:app/models/event_model.dart';
import 'package:app/models/user_model.dart';
import 'package:app/services/auth.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Event extends StatefulWidget {
  final EventModel event;
  final bool news;
  Event(this.event, {Key key, this.news = false}) : super(key: key);

  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<Event> with AfterLayoutMixin {
  UserModel userModel = UserModel();
  Color color, inverseColor;
  FlutterWebviewPlugin webviewPlugin;

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    userModel = await AuthService().getCachedUser();
    setState(() {
      userModel = userModel;
    });
  }

  bool canGoBack = false;

  @override
  Widget build(BuildContext context) {
    color = getColor(context);
    inverseColor = getInverseColor(context);
    return WillPopScope(
      onWillPop: () async {
        if (webviewPlugin != null) {
          try {
            webviewPlugin.canGoBack().then((val) {
              setState(() {
                canGoBack = val;
              });
            });
          } catch (e) {
            return null;
          }
          if (canGoBack) {
            webviewPlugin.goBack();
            return false;
          } else {
            webviewPlugin.hide();
            webviewPlugin.close();
          }
        }
        return true;
      },
      child: Scaffold(
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
          title: Text(widget.event.title),
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
                venue: widget.event.venue,
                dateTime: widget.event.dateTime,
              ),
              size24Box,
              buildTag(),
              size24Box,
              buildDescription(),
              size24Box,
              buildPoster(),
              size24Box,
              buildRegister(context),
              size24Box,
              ...buildSpeaker(),
              size24Box,
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildSpeaker() {
    return widget.event.speakers == null
        ? []
        : [
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
                  if (widget.event.speakers != null)
                    ...widget.event.speakers
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
            )
          ];
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

  handleRegister() async {
    if (!widget.news && userModel.email == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text(
                  'Signin required',
                  style: textStyleSize24Bold.copyWith(color: color),
                ),
                content: Text(
                  'Click ok to continue',
                  style: TextStyle(color: color),
                ),
                actions: <Widget>[
                  FlatButton(
                      onPressed: () async {
                        while (Navigator.of(context).canPop()) {
                          Navigator.of(context).pop();
                        }
                        Navigator.of(context).pushReplacementNamed('/');
                      },
                      child: Text('Ok')),
                  FlatButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    child: Text('Cancel'),
                  ),
                ],
              ));
      return;
    }
    if (!widget.event.link.contains('/viewform?usp=pp_url')) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      bool inAppBrowser = sharedPreferences.getBool('inAppBrowser');
      print('In App Broswer $inAppBrowser');
      switch (inAppBrowser) {
        case true:
          openWebView();
          break;
        case false:
          launchURL(widget.event.link);
          break;
        default:
          showDialog(
              context: context,
              builder: (_) {
                return MyAlertDialog(
                  widget: widget,
                  openWebView: openWebView,
                );
              });
          return;
      }
    } else {
      openWebView();
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SafeArea(
          child: WebviewScaffold(
            url: widget.event.link,
          ),
        ),
      ),
    );
  }

  openWebView() {
    webviewPlugin = FlutterWebviewPlugin();
    webviewPlugin.onUrlChanged.listen((url) {
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
    // webviewPlugin.onBack.listen((_) async {
    //   print('Back');
    //   if (await webviewPlugin.canGoBack()) {
    //     showDialog(
    //         context: context,
    //         builder: (_) => AlertDialog(
    //               actions: <Widget>[
    //                 FlatButton(
    //                   onPressed: () {
    //                     Navigator.of(context).pop();
    //                     webviewPlugin.close();
    //                   },
    //                   child: Text('Yes'),
    //                 ),
    //                 FlatButton(
    //                   onPressed: () {
    //                     Navigator.of(context).pop();
    //                   },
    //                   child: Text('No'),
    //                 )
    //               ],
    //               title: Text('Form not submitted'),
    //               content: Text(
    //                 'Do you want to leave ?',
    //                 strutStyle: StrutStyle(
    //                   height: 1.5,
    //                 ),
    //               ),
    //             ));
    //   } else
    //     webviewPlugin.goBack();
    // });
    widget.event.link =
        widget.event.link.replaceFirst('%3Cname%3C', userModel.name);
    widget.event.link =
        widget.event.link.replaceFirst('%3Cemail%3C', userModel.email);
    String year = 'First+Year';
    switch (userModel.year) {
      case '1':
        break;
      case '2':
        year = 'Second+Year';
        break;
      case '3':
        year = 'Third+Year';
        break;
      case '4':
        year = 'Fourth+Year';
        break;
      case '5':
        year = 'Fifth+Year';
        break;
    }
    widget.event.link = widget.event.link.replaceFirst('%3Cyear%3C', year);
    webviewPlugin.launch(widget.event.link);
  }

  Widget buildRegister(BuildContext context) {
    return widget.event.link != null
        ? InkWell(
            splashColor: Colors.red,
            borderRadius: BorderRadius.horizontal(right: Radius.circular(64)),
            onTap: handleRegister,
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
                    widget.news ? 'Link' : 'Register',
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

  Widget buildPoster() {
    return widget.event.img == null
        ? Container()
        : Padding(
            padding: edgeInsets24Horizontal,
            child: Card(
              shape: roundedRectangleBorder8,
              child: ClipRRect(
                borderRadius: borderRadius8,
                child: Hero(
                  tag: widget.event.title,
                  child: CachedNetworkImage(
                    placeholder: (_, __) => Center(
                      child: CircularProgressIndicator(),
                    ),
                    imageUrl: widget.event.img,
                  ),
                ),
              ),
            ),
          );
  }

  Widget buildDescription() {
    return widget.event.desc != null
        ? Padding(
            padding: edgeInsets24Horizontal,
            child: Text(
              widget.event.desc,
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
    return widget.event.tag != null
        ? Padding(
            padding: edgeInsets24Horizontal,
            child: Text(
              widget.event.tag,
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

class MyAlertDialog extends StatefulWidget {
  MyAlertDialog({
    Key key,
    @required this.widget,
    @required this.openWebView,
  }) : super(key: key);

  final Event widget;
  final Function openWebView;

  @override
  _MyAlertDialogState createState() => _MyAlertDialogState(openWebView);
}

class _MyAlertDialogState extends State<MyAlertDialog> {
  bool alwaysUse = true;
  final Function openWebView;

  _MyAlertDialogState(this.openWebView);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Use in app browser ?'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CheckboxListTile(
              selected: alwaysUse,
              title: Text('Always use in-app browser'),
              subtitle: Text('You can always change this in settings'),
              value: alwaysUse,
              onChanged: (val) {
                print(alwaysUse);
                setState(() {
                  alwaysUse = val;
                });
              }),
        ],
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () async {
              Navigator.of(context).pop();
              if (alwaysUse) {
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.setBool('inAppBrowser', true);
              }
              openWebView();
            },
            child: Text('Yes')),
        FlatButton(
            onPressed: () {
              launchURL(widget.widget.event.link);
              Navigator.of(context).pop();
            },
            child: Text('No')),
      ],
    );
  }
}

import 'package:app/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';

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
        title: Text('Flutter Workshop'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildDateTimeVenu(
              context,
              date: '25 April 2020',
              venue: 'CTV 108',
              time: '9 AM',
            ),
            size24Box,
            buildMain(),
            size24Box,
            buildDescription(),
            size24Box,
            buildPoster(event.img),
            size24Box,
            buildRegister(),
            size24Box,
            Padding(
              padding: edgeInsets24Horizontal,
              child: Text('Speakers',
                  style: textStyleSize24Bold.copyWith(
                    color: color,
                  )),
            ),
            size24Box,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  size24Box,
                  Column(
                    children: <Widget>[
                      ClipOval(
                        child: Image.asset(
                          'assets/avatar.jpg',
                          height: 64,
                        ),
                      ),
                      size24Box,
                      Text(
                        'Seshan',
                        style: TextStyle(
                          fontSize: 18,
                          color: color,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            size24Box,
          ],
        ),
      ),
    );
  }

  Container buildRegister() {
    return Container(
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
    );
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
            child: Image.asset('assets/temp.jpg'),
          ),
        ),
      ),
    );
  }

  Padding buildDescription() {
    return Padding(
      padding: edgeInsets24Horizontal,
      child: Text(
        'In this quarantine pause your boredom and let the colours swirl around while designs dance with imagination as limit and let the esthetic part of your brain enjoy with the mindstruck graphics popping on your laptops. Register using your SASTRA Mail ID. We will be hosting this session on Google Meet platform, make sure you have it ready.',
        style: TextStyle(
          color: color,
          wordSpacing: 1.5,
          height: 1.5,
          fontSize: 18,
        ),
      ),
    );
  }

  Padding buildMain() {
    return Padding(
      padding: edgeInsets24Horizontal,
      child: Text(
        'Basics of Photoshop',
        style: textStyleSize24Bold.copyWith(color: color),
      ),
    );
  }

  Padding buildDateTimeVenu(BuildContext context,
      {String time, String date, String venue}) {
    print(Theme.of(context).brightness);
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
              if (date != null)
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.calendar_today,
                      size: 24,
                      color: Colors.white,
                    ),
                    size24Box,
                    Text(
                      date,
                      style: textStyle18.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              if (time != null) size24Box,
              if (time != null)
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.access_time,
                      size: 24,
                      color: Colors.white,
                    ),
                    size24Box,
                    Text(
                      time,
                      style: textStyle18.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
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

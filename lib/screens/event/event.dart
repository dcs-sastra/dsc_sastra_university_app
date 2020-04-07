import 'package:flutter/material.dart';
import 'package:app/constants.dart';

class Event extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              date: '25 April 2020',
              venue: 'CTV 108',
              time: '9 AM',
            ),
            size24Box,
            buildMain(),
            size24Box,
            buildDescription(),
            size24Box,
            buildPoster(),
            size24Box,
            buildRegister(),
            size24Box,
            Padding(
              padding: edgeInsets24Horizontal,
              child: Text(
                'Speakers',
                style: textStyleSize24Bold,
              ),
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

  Padding buildPoster() {
    return Padding(
      padding: edgeInsets24Horizontal,
      child: Card(
        shape: roundedRectangleBorder8,
        child: ClipRRect(
          borderRadius: borderRadius8,
          child: Hero(
            tag: 'Basics of Photoshop',
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
        strutStyle: StrutStyle(
          height: 1.5,
        ),
        style: TextStyle(
          letterSpacing: 0.5,
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
        style: textStyleSize24Bold,
      ),
    );
  }

  Padding buildDateTimeVenu({String time, String date, String venue}) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Card(
        shape: roundedRectangleBorder8,
        color: Colors.blue,
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
                      style: textStyle18White,
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
                      style: textStyle18White,
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
                      style: textStyle18White,
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

import 'package:app/constants.dart';
import 'package:app/models/event_model.dart';
import 'package:app/screens/event/event.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final EventModel event;

  const NewsCard(this.event, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    LinearGradient linearGradient = LinearGradient(
        colors: Theme.of(context).brightness == Brightness.light
            ? [Colors.blue.shade900, Colors.blue]
            : [Colors.blueGrey, Colors.blueGrey.shade100]);
    return GestureDetector(
      onTap: () => Event(event),
      child: Container(
        height: double.maxFinite,
        width: width * 0.6,
        child: Card(
          shape: roundedRectangleBorder8,
          child: Container(
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              borderRadius: borderRadius8,
              gradient: linearGradient,
            ),
            padding: EdgeInsets.all(24),
            child: Text(
              event.title,
              style: textStyle18.copyWith(
                color: getInverseColor(context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

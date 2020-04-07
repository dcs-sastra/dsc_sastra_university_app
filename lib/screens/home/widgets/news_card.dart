import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String title;

  const NewsCard({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    LinearGradient linearGradient = LinearGradient(
        colors: Theme.of(context).brightness == Brightness.light
            ? [Colors.blue.shade900, Colors.blue]
            : [Colors.blueGrey, Colors.blueGrey.shade100]);
    return Container(
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
            title,
            style: textStyle18.copyWith(
              color: getInverseColor(context),
            ),
          ),
        ),
      ),
    );
  }
}

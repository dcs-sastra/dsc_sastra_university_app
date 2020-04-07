import 'package:flutter/material.dart';
import 'package:app/constants.dart';

import '../../event/event.dart';

class UpcomingEventCard extends StatelessWidget {
  const UpcomingEventCard({
    Key key,
    @required this.title,
    @required this.imageUrl,
    @required this.docId,
  }) : super(key: key);

  final title, imageUrl, docId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => Event()));
      },
      child: Container(
        margin: edgeInsets24Horizontal.copyWith(bottom: 24),
        height: double.maxFinite,
        width: double.maxFinite,
        child: Card(
          shape: roundedRectangleBorder8,
          elevation: 8,
          child: ClipRRect(
            borderRadius: borderRadius8,
            child: Stack(
              children: <Widget>[
                Hero(
                  tag: title,
                  child: Image.asset(
                    'assets/temp.jpg',
                    fit: BoxFit.cover,
                    height: double.maxFinite,
                    width: double.maxFinite,
                    color: Colors.black38,
                    colorBlendMode: BlendMode.multiply,
                  ),
                ),
                Positioned(
                  bottom: 24,
                  left: 24,
                  child: Text(
                    title,
                    style: textStyleSize24Bold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

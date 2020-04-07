import 'package:flutter/material.dart';
import 'package:app/constants.dart';

import '../../event/event.dart';

class EventCard extends StatelessWidget {
  const EventCard({
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
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => Event(
              title: title,
              docId: docId,
              image: imageUrl,
            ),
          ),
        );
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
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      title,
                      style: textStyleSize24Bold.copyWith(
                        color: Colors.white,
                      ),
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

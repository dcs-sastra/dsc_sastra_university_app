import 'package:app/models/event_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';

import '../../event/event.dart';

class EventCard extends StatelessWidget {
  const EventCard(this.event, {Key key}) : super(key: key);

  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => Event(event),
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
                  tag: event.title,
                  child: event.img == null || event.img == ""
                      ? Image.asset('assets/temp.jpg')
                      : CachedNetworkImage(
                          placeholder: (_, __) => Center(
                            child: CircularProgressIndicator(),
                          ),
                          imageUrl: event.img,
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
                      event.title,
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

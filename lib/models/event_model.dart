import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  String title, desc, venue, tag, link, img;
  DateTime dateTime;
  List<int> speakers;

  EventModel({
    this.title,
    this.desc,
    this.venue,
    this.tag,
    this.link,
    this.img,
    this.dateTime,
    this.speakers,
  });

  EventModel.fromMap(Map<String, dynamic> map) {
    dateTime = (map['date'] as Timestamp).toDate();
    venue = map['venue'];
    img = map['img'];
    speakers = map['spkrs'];
    link = map['link'];
    tag = map['tag'];
    desc = map['desc'];
  }
}

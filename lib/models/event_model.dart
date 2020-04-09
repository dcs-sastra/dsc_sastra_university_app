import 'package:app/models/model_structure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel extends ModelStructure<EventModel> {
  String title, desc, venue, tag, link, img;
  DateTime dateTime;
  List<dynamic> speakers;

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
    dateTime = ((map['date'] as Timestamp) ?? Timestamp.now()).toDate();
    venue = map['venue'];
    img = map['img'];
    speakers = map['spkrs'];
    link = map['link'];
    tag = map['tag'];
    desc = map['desc'];
    title = map['title'];
  }

  @override
  EventModel fromDocumentSnapshot(DocumentSnapshot dss) {
    return EventModel.fromMap(dss.data);
  }

  @override
  String toString() {
    return 'Title : $title';
  }

  @override
  EventModel createInstance() => EventModel();
}

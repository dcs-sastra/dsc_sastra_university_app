import 'package:app/models/event_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventCollection {
  CollectionReference _events = Firestore.instance.collection('event');

  Future<EventModel> fetchUpcomingEvents() async {
    (await _events
            .where(
              'date',
              isGreaterThanOrEqualTo: Timestamp.now(),
            )
            .orderBy('date')
            .getDocuments())
        .documents
        .forEach(
          (f) => print(f.data),
        );

    return null;
  }

  Future<EventModel> fetchRecents() async {
    (await _events
            .where(
              'date',
              isLessThanOrEqualTo: Timestamp.now(),
            )
            .orderBy('date')
            .getDocuments())
        .documents
        .forEach(
          (f) => print(f.data),
        );

    return null;
  }
}

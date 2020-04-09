import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:app/constants.dart';

class EventCollection {
  CollectionReference _events = Firestore.instance.collection('event');

  Future<int> getLength() async {
    return (await Firestore.instance.document('others/event').get())
        .data['count'];
  }

  Future<List<DocumentSnapshot>> fetchUpcomingEvents(
      {DocumentSnapshot documentSnapshot}) async {
    if (documentSnapshot == null) {
      return (await _events
              .where('date', isGreaterThanOrEqualTo: Timestamp.now())
              .orderBy('date')
              .limit(paginationLimit)
              .getDocuments())
          .documents;
    } else {
      return (await _events
              .where('date', isGreaterThanOrEqualTo: Timestamp.now())
              .orderBy('date')
              .limit(paginationLimit)
              .startAfterDocument(documentSnapshot)
              .getDocuments())
          .documents;
    }
  }

  Future<List<DocumentSnapshot>> fetchRecents(
      {DocumentSnapshot documentSnapshot}) async {
    if (documentSnapshot == null) {
      return (await _events
              .where('date', isLessThan: Timestamp.now())
              .orderBy('date')
              .limit(paginationLimit)
              .getDocuments())
          .documents;
    } else {
      return (await _events
              .where('date', isLessThan: Timestamp.now())
              .orderBy('date')
              .limit(paginationLimit)
              .startAfterDocument(documentSnapshot)
              .getDocuments())
          .documents;
    }
  }
}

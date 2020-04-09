import 'package:cloud_firestore/cloud_firestore.dart';

import '../../constants.dart';

class NewsCollection {
  CollectionReference _news = Firestore.instance.collection('news');
  Future<int> getLength() async {
    return (await Firestore.instance.document('others/news').get())
        .data['count'];
  }

  Future<List<DocumentSnapshot>> fetchNews(
      {DocumentSnapshot documentSnapshot}) async {
    if (documentSnapshot == null) {
      return (await _news
              .orderBy('date', descending: true)
              .limit(paginationLimit)
              .getDocuments())
          .documents;
    } else {
      return (await _news
              .orderBy('date', descending: true)
              .limit(paginationLimit)
              .startAfterDocument(documentSnapshot)
              .getDocuments())
          .documents;
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../constants.dart';

class NewsCollection {
  CollectionReference _news = Firestore.instance.collection('event');

  // addDummyDocs(Map<String, dynamic> map) {
  //   for (var i = 0; i < 20; i++) {
  //     _news.add(map);
  //   }
  // }

  Future<List<DocumentSnapshot>> fetchNews(
      {DocumentSnapshot documentSnapshot}) async {
    print('Fetching News');
    if (documentSnapshot == null) {
      return (await _news
              .orderBy('title', descending: true)
              .limit(paginationLimit)
              .getDocuments())
          .documents;
    } else {
      return (await _news
              .orderBy('title', descending: true)
              .limit(paginationLimit)
              .startAfterDocument(documentSnapshot)
              .getDocuments())
          .documents;
    }
  }
}

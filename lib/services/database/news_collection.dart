import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app/constants.dart';

class NewsCollection {
  CollectionReference _news = Firestore.instance.collection('news');

  Future<List<DocumentSnapshot>> fetchNews(
      {DocumentSnapshot documentSnapshot}) async {
    if (documentSnapshot == null) {
      return (await _news.orderBy('date').limit(paginationLimit).getDocuments())
          .documents;
    } else {
      return (await _news
              .orderBy('date')
              .limit(paginationLimit)
              .startAfterDocument(documentSnapshot)
              .getDocuments())
          .documents;
    }
  }
}

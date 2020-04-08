import 'package:cloud_firestore/cloud_firestore.dart';

class NewsModel {
  String desc, img, tag, title;
  List<String> links;

  NewsModel.fromMap(Map<String, dynamic> map) {
    desc = map['desc'];
    img = map['img'];
    tag = map['tag'];
    title = map['title'];
    links = map['links'];
  }

  static List<NewsModel> fromDocSnapList(List<DocumentSnapshot> news) {
    return news.map((f) => NewsModel.fromMap(f.data)).toList();
  }
}

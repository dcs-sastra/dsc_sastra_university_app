import 'package:cloud_firestore/cloud_firestore.dart';

class ClusterCollection {
  final CollectionReference _collectionReference;
  final String cluster;

  ClusterCollection(this.cluster)
      : _collectionReference =
            Firestore.instance.collection('gallery/$cluster/images');

  Future<List<dynamic>> getImages() async {
    return (await _collectionReference
            .orderBy('date', descending: true)
            .getDocuments())
        .documents
        .map((f) => f['url'])
        .toList();
  }
}

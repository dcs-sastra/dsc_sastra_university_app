import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ModelStructure<T> {
  T fromDocumentSnapshot(DocumentSnapshot dss);
  T createInstance();
}

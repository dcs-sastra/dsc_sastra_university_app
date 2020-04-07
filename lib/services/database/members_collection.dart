import 'package:cloud_firestore/cloud_firestore.dart';

class MemberCollection {
  CollectionReference _members = Firestore.instance.collection('/members');
  
}

import 'package:app/models/member_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MemberCollection {
  CollectionReference _members = Firestore.instance.collection('/members');

  Future<List<MemberModel>> fetchMembers() async {
    return (await _members.getDocuments())
        .documents
        .map(
          (f) => MemberModel.fromMap(f.data),
        )
        .toList();
  }
}

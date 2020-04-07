import 'package:app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserCollection {
  CollectionReference _user = Firestore.instance.collection('user');

  Future createUser(Map<String, dynamic> user) async {
    print('Adding User');
    return await _user.document(user['e']).setData(user);
  }

  Future updateUser(Map<String, dynamic> user) async {
    print('Updating User');
    return await _user.document(user['e']).updateData(user);
  }
}

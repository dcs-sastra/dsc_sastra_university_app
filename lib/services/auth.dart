import 'package:app/models/user_model.dart';
import 'package:app/services/database/user_collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> isSignedIn() async {
    return (await _auth.currentUser() != null);
  }

  void signOut() {
    _auth.signOut();
  }

  Future cacheUser(Map<String, String> user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    user.keys.forEach((f) {
      sharedPreferences.setString(f, user[f]);
    });
  }

  Future<UserModel> getCachedUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Set<String> keys = sharedPreferences.getKeys()..remove('mode');
    Map<String, String> userMap = {};
    keys.forEach((f) => userMap[f] = sharedPreferences.get(f));
    return UserModel.fromMap(userMap);
  }

  Future googleSignIn(BuildContext context) async {
    GoogleSignInAccount googleSignInAccount = await GoogleSignIn(scopes: [
      'email',
      'https://www.googleapis.com/auth/userinfo.profile',
    ]).signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    if (authResult != null) {
      if (authResult.additionalUserInfo.isNewUser) {
        FirebaseUser user = authResult.user;
        Map<String, dynamic> temp = UserModel(
          email: user.email,
          name: user.displayName,
          phoneNumber: user.phoneNumber,
          year: (user.email.contains('sastra.ac.in')
                  ? 4 -
                      (int.parse(user.email.substring(1, 3)) +
                          2000 -
                          DateTime.now().year)
                  : 0)
              .toString(),
        ).toMap();
        await UserCollection().createUser(temp);
        await cacheUser(temp);
        Navigator.of(context).pushNamed(
          '/signup',
          arguments: authResult.user,
        );
      } else
        Navigator.of(context).pushNamed('/home');
    }
    return authResult;
  }
}

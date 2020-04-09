import 'package:app/models/user_model.dart';
import 'package:app/services/database/user_collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> isSignedIn() async {
    FirebaseUser user = await _auth.currentUser();
    if ((user != null) && (await getCachedUser()).email == null) {
      cacheExistingUser(user.email);
    }
    return user != null;
  }

  Future<void> signOut(BuildContext context) async {
    await _auth.signOut();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    Navigator.of(context).pushReplacementNamed('/');
  }

  Future cacheUser(Map<String, dynamic> user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    user.keys.forEach((f) {
      sharedPreferences.setString(f, user[f]);
    });
  }

  Future<UserModel> getCachedUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Set<String> keys = sharedPreferences.getKeys()
      ..remove('mode')
      ..remove('inAppBrowser');
    Map<String, String> userMap = {};
    keys.forEach((f) {
      userMap[f] = sharedPreferences.get(f);
    });
    return userMap == {} ? null : UserModel.fromMap(userMap);
  }

  Future<AuthResult> googleSignIn(BuildContext context) async {
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
        Navigator.of(context).pushNamed(
          '/signup',
          arguments: authResult.user,
        );
      } else {
        if ((await getCachedUser()).email == null)
          cacheExistingUser(authResult.user.email);
        Navigator.of(context).pushReplacementNamed('/home');
      }
    }
    return authResult;
  }

  cacheExistingUser(String email) async {
    await cacheUser(await UserCollection().getUser(email));
  }
}

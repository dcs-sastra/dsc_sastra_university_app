import 'package:after_layout/after_layout.dart';
import 'package:app/constants.dart';
import 'package:app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> with AfterLayoutMixin {
  bool isSignedIn = true;

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    isSignedIn = await AuthService().isSignedIn();
    if (isSignedIn) {
      Navigator.of(context).pushReplacementNamed('/home');
    } else
      setState(() {
        isSignedIn = isSignedIn;
      });
  }

  @override
  Widget build(BuildContext context) {
    return buildLanding(context);
  }

  Scaffold buildLanding(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: double.maxFinite),
            Spacer(),
            Image.asset(
              'assets/logo.png',
              width: MediaQuery.of(context).size.width * 0.3,
            ),
            size24Box,
            Padding(
              padding: edgeInsets24Horizontal,
              child: Text(
                'DSC SASTRA Deemed to be University',
                textAlign: TextAlign.center,
                style: textStyleSize24Bold,
              ),
            ),
            Spacer(),
            ...(isSignedIn
                ? [
                    Image.asset(
                      'assets/loading.gif',
                      width: 196,
                    )
                  ]
                : buildSignInButtons()),
            Spacer(),
            Image.asset(
              'assets/andy.gif',
              height: 128,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildSignInButtons() {
    return [
      GestureDetector(
        onTap: () => AuthService().googleSignIn(context),
        child: Card(
          shape: roundedRectangleBorder8,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/google.svg',
                  height: 32,
                ),
                Container(
                  height: 32,
                  width: 2,
                  color: Colors.black45,
                  margin: edgeInsets24Horizontal,
                ),
                Text('Login with Google')
              ],
            ),
          ),
        ),
      ),
      size24Box,
      FlatButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/home');
        },
        child: Text(
          'Enter as Guest',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            decoration: TextDecoration.underline,
          ),
        ),
      )
    ];
  }
}

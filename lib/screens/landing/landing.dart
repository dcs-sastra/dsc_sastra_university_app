import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            Text(
              'DSC SASTRA Deemed to be University',
              textAlign: TextAlign.center,
              style: textStyleSize24Bold,
            ),
            Spacer(),
            GestureDetector(
              onTap: () {},
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
                onPressed: () {},
                child: Text(
                  'Enter as Guest',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.underline,
                  ),
                )),
            size24Box,
          ],
        ),
      ),
    );
  }
}

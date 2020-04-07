import 'package:app/screens/landing/landing.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/home/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DSC Sastra University',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // brightness: Brightness.dark,
        textTheme: GoogleFonts.ubuntuTextTheme(),
      ),
      routes: {
        '/': (_) => Landing(),
      },
    );
  }
}

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double w;

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: Container(color: Colors.green),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.android),
            SizedBox(width: 16),
            Text("DSC SASTRA")
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/event/Hey");
                },
                child: Text("Hey"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/aboutus");
                },
                child: Text("About Us"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/events");
                },
                child: Text("About Us"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

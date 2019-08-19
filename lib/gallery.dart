import 'package:flutter/material.dart';
import 'dart:math';

class Gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.extent(
        maxCrossAxisExtent: 200.0,
        mainAxisSpacing: 15.0,
        crossAxisSpacing: 15.0,
        padding: const EdgeInsets.all(5.0),
        children: _buildGridTitle(20),
      ),
    );
  }
}

List<Widget> _buildGridTitle(numberOfTitles) {
  var rand= Random();
  
  List<Container> containers =
      new List<Container>.generate(numberOfTitles, (int index) {
    final imageName = 'images/image${index + 1}.jpg';

    return new Container(
      // height: 100,
      // width: 100,

      child: new Image.asset(
        // imageName,
        "assets/flutter.jpg",
        fit: BoxFit.cover,
      ),
    );
  });

  return containers;
}

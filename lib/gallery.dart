import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math';

class Gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      child:StaggeredGridView.countBuilder(
        crossAxisCount: 4,
  itemCount: 8,
  itemBuilder: (BuildContext context, int index) => new Container(
      color: Colors.green,
      child: new Center(
        child: new CircleAvatar(
          backgroundColor: Colors.white,
          child: new Text('$index'),
        ),
      )),
  staggeredTileBuilder: (int index) =>
      new StaggeredTile.count(2, index.isEven ? 2 : 1),
  mainAxisSpacing: 4.0,
  crossAxisSpacing: 4.0,
      ),
    );
  }
}

List<Widget> _buildGridTitle(numberOfTitles) {
  var rand = Random();

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

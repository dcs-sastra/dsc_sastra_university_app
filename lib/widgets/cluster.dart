import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: 12,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) =>
            new Container(child: _buildGridTitle(index + 1)[index]),
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, index.isEven ? 2 : 1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }

  List<Widget> _buildGridTitle(numberOdTitles) {
    List<Container> containers =
        new List<Container>.generate(numberOdTitles, (int index) {
      final imageName = 'assets/dsc/cloud (${index + 1}).jpg';
      return new Container(
        child: new Image.asset(
          imageName,
          fit: BoxFit.cover,
        ),
      );
    });

    return containers;
  }
}

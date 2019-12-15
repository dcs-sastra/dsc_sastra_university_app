import 'package:flutter/cupertino.dart';

// Custom padding implementation for event details page
class MyPadding extends StatelessWidget {
  final Widget child;

  MyPadding({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
      child: child,
    );
  }
}

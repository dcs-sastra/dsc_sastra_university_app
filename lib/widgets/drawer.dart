import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title, route;
  final IconData icon;

  DrawerItem(this.title, this.route, this.icon);

  @override
  Widget build(BuildContext context) {
    Color color = title == "Home" ? Colors.blue : Colors.black;
    Color bgColor =
        title == "Home" ? Colors.blue.withOpacity(0.2) : Colors.white;

    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(route),
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: EdgeInsets.only(right: 16, top: 16),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(32),
                bottomRight: Radius.circular(32))),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: color,
              size: 26,
            ),
            SizedBox(
              width: 24,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  color: color,
                  fontWeight:
                      title == "Home" ? FontWeight.bold : FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }
}

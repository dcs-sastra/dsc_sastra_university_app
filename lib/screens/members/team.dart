import 'package:flutter/material.dart';

import '../../constants.dart';
import 'widgets/cluster_members.dart';

class Team extends StatefulWidget {
  @override
  _TeamState createState() => _TeamState();
}

class _TeamState extends State<Team> {
  Color color, inverseColor;
  @override
  Widget build(BuildContext context) {
    color = getColor(context);
    inverseColor = getInverseColor(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: inverseColor,
        textTheme: Theme.of(context).textTheme.copyWith(
              title: Theme.of(context).textTheme.title.copyWith(
                    color: color,
                  ),
            ),
        iconTheme: Theme.of(context).iconTheme.copyWith(
              color: color,
            ),
        title: Text('Team'),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: clusters.length,
        itemBuilder: (_, i) {
          return Container(
            height: 196,
            child: ClusterMembers(clusters[i]),
          );
        },
      ),
    );
  }
}

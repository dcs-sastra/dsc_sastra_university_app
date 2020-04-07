import 'package:app/models/cluster_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClusterIconButton extends StatelessWidget {
  const ClusterIconButton(this.cluster, {Key key}) : super(key: key);

  final ClusterModel cluster;

  @override
  Widget build(BuildContext context) {
    double widthBy3 = MediaQuery.of(context).size.width / 3;
    return Tooltip(
      message: cluster.cluster,
      child: Container(
        height: widthBy3 - 48,
        width: widthBy3 - 48,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          // border: Border.all(color: cluster.color.withOpacity(0.3), width: 2),
          color: cluster.color.withOpacity(0.3),
          borderRadius: BorderRadius.circular(16),
        ),
        child: SvgPicture.asset('assets/icons/${cluster.image}.svg'),
      ),
    );
  }
}

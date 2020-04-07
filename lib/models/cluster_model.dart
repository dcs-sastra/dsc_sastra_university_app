import 'package:flutter/material.dart';

class ClusterModel {
  final Color color;
  final String cluster, description, image;

  const ClusterModel({
    @required this.color,
    @required this.cluster,
    @required this.description,
    @required this.image,
  });
}

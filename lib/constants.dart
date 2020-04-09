import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'models/cluster_model.dart';

const size24Box = const SizedBox(
  height: 24,
  width: 24,
);

const TextStyle textStyleSize24Bold = const TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

const edgeInsets24Horizontal = const EdgeInsets.symmetric(horizontal: 24);

BorderRadius borderRadius8 = BorderRadius.circular(8);
ShapeBorder roundedRectangleBorder8 = RoundedRectangleBorder(
  borderRadius: borderRadius8,
);

const textStyle18 = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

Color getColor(BuildContext context) {
  return Theme.of(context).brightness == Brightness.light
      ? Colors.black
      : Colors.white;
}

Color getInverseColor(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark
      ? Colors.black
      : Colors.white;
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  }
}

List<ClusterModel> clusters = [
  ClusterModel(
    cluster: 'Android',
    color: Colors.green,
    description:
        'Id ut elit et voluptate deserunt non dolore nulla nostrud. Laborum nostrud qui laboris reprehenderit. Eu amet consectetur sunt veniam ipsum cupidatat veniam nostrud duis officia ea occaecat. Non laboris Lorem pariatur sint eu aute labore do duis in. Anim dolore sit dolor minim occaecat pariatur qui officia aute exercitation occaecat sint velit. Excepteur minim consectetur velit aliquip.',
    image: 'android',
  ),
  ClusterModel(
    cluster: 'Web Development',
    color: Colors.red,
    description:
        'Id ut elit et voluptate deserunt non dolore nulla nostrud. Laborum nostrud qui laboris reprehenderit. Eu amet consectetur sunt veniam ipsum cupidatat veniam nostrud duis officia ea occaecat. Non laboris Lorem pariatur sint eu aute labore do duis in. Anim dolore sit dolor minim occaecat pariatur qui officia aute exercitation occaecat sint velit. Excepteur minim consectetur velit aliquip.',
    image: 'web',
  ),
  ClusterModel(
    cluster: 'Flutter Development',
    color: Colors.blue,
    description:
        'Id ut elit et voluptate deserunt non dolore nulla nostrud. Laborum nostrud qui laboris reprehenderit. Eu amet consectetur sunt veniam ipsum cupidatat veniam nostrud duis officia ea occaecat. Non laboris Lorem pariatur sint eu aute labore do duis in. Anim dolore sit dolor minim occaecat pariatur qui officia aute exercitation occaecat sint velit. Excepteur minim consectetur velit aliquip.',
    image: 'flutter',
  ),
  ClusterModel(
    cluster: 'Machine Learning',
    color: Colors.blue,
    description:
        'Id ut elit et voluptate deserunt non dolore nulla nostrud. Laborum nostrud qui laboris reprehenderit. Eu amet consectetur sunt veniam ipsum cupidatat veniam nostrud duis officia ea occaecat. Non laboris Lorem pariatur sint eu aute labore do duis in. Anim dolore sit dolor minim occaecat pariatur qui officia aute exercitation occaecat sint velit. Excepteur minim consectetur velit aliquip.',
    image: 'ml',
  ),
  ClusterModel(
    cluster: 'Augmented Reality',
    color: Colors.yellow,
    description:
        'Id ut elit et voluptate deserunt non dolore nulla nostrud. Laborum nostrud qui laboris reprehenderit. Eu amet consectetur sunt veniam ipsum cupidatat veniam nostrud duis officia ea occaecat. Non laboris Lorem pariatur sint eu aute labore do duis in. Anim dolore sit dolor minim occaecat pariatur qui officia aute exercitation occaecat sint velit. Excepteur minim consectetur velit aliquip.',
    image: 'ar',
  ),
  ClusterModel(
    cluster: 'Cloud',
    color: Colors.green,
    description:
        'Id ut elit et voluptate deserunt non dolore nulla nostrud. Laborum nostrud qui laboris reprehenderit. Eu amet consectetur sunt veniam ipsum cupidatat veniam nostrud duis officia ea occaecat. Non laboris Lorem pariatur sint eu aute labore do duis in. Anim dolore sit dolor minim occaecat pariatur qui officia aute exercitation occaecat sint velit. Excepteur minim consectetur velit aliquip.',
    image: 'cloud',
  ),
  ClusterModel(
    cluster: 'Graphic Designing',
    color: Colors.green,
    description:
        'Id ut elit et voluptate deserunt non dolore nulla nostrud. Laborum nostrud qui laboris reprehenderit. Eu amet consectetur sunt veniam ipsum cupidatat veniam nostrud duis officia ea occaecat. Non laboris Lorem pariatur sint eu aute labore do duis in. Anim dolore sit dolor minim occaecat pariatur qui officia aute exercitation occaecat sint velit. Excepteur minim consectetur velit aliquip.',
    image: 'gd',
  ),
  ClusterModel(
    cluster: 'Marketing',
    color: Colors.blue,
    description:
        'Id ut elit et voluptate deserunt non dolore nulla nostrud. Laborum nostrud qui laboris reprehenderit. Eu amet consectetur sunt veniam ipsum cupidatat veniam nostrud duis officia ea occaecat. Non laboris Lorem pariatur sint eu aute labore do duis in. Anim dolore sit dolor minim occaecat pariatur qui officia aute exercitation occaecat sint velit. Excepteur minim consectetur velit aliquip.',
    image: 'marketing',
  ),
  ClusterModel(
    cluster: 'Content Writing',
    color: Colors.red,
    description:
        'Id ut elit et voluptate deserunt non dolore nulla nostrud. Laborum nostrud qui laboris reprehenderit. Eu amet consectetur sunt veniam ipsum cupidatat veniam nostrud duis officia ea occaecat. Non laboris Lorem pariatur sint eu aute labore do duis in. Anim dolore sit dolor minim occaecat pariatur qui officia aute exercitation occaecat sint velit. Excepteur minim consectetur velit aliquip.',
    image: 'cw',
  ),
];

const int paginationLimit = 2;

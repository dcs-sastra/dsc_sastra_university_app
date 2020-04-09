import 'package:after_layout/after_layout.dart';
import 'package:app/models/cluster_model.dart';
import 'package:app/services/database/gallery_collection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Cluster extends StatefulWidget {
  final ClusterModel cluster;

  Cluster(this.cluster);

  @override
  _ClusterState createState() => _ClusterState();
}

class _ClusterState extends State<Cluster> with AfterLayoutMixin {
  List<dynamic> images;
  Color color, inverseColor;

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    images = await ClusterCollection(widget.cluster.image).getImages();
    setState(() {
      images = images;
    });
  }

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
        title: Text(widget.cluster.cluster),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset('assets/clusters/${widget.cluster.image}.jpg'),
            size24Box,
            Padding(
              padding: edgeInsets24Horizontal,
              child: Text(
                widget.cluster.description,
                style: textStyle18.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            size24Box,
            if (images != null)
              ExpansionTile(
                title: Text('Gallery'),
                children: images
                    .map(
                      (f) => Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Card(
                          elevation: 8,
                          shape: roundedRectangleBorder8,
                          child: ClipRRect(
                            borderRadius: borderRadius8,
                            child: CachedNetworkImage(imageUrl: f),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              )
          ],
        ),
      ),
    );
  }
}

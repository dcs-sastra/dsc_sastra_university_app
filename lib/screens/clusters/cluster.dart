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

class _ClusterState extends State<Cluster> {
  List<dynamic> images = [];
  Color color, inverseColor;
  bool isLoaded = false;

  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
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
        physics: BouncingScrollPhysics(),
        controller: _controller,
        child: Column(
          children: <Widget>[
            Image.asset('assets/clusters/${widget.cluster.image}.jpg'),
            size24Box,
            Padding(
              padding: edgeInsets24Horizontal,
              child: Text(
                widget.cluster.description,
                style: textStyle18.copyWith(
                  color: color,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            size24Box,
            ExpansionTile(
              onExpansionChanged: (expanded) async {
                if (!isLoaded) {
                  images =
                      await ClusterCollection(widget.cluster.image).getImages();
                  setState(() {
                    images = images;
                    isLoaded = true;
                  });
                  if (images.isNotEmpty)
                    _controller.animateTo(200,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeInOut);
                } else if (expanded && images.isNotEmpty)
                  Future.delayed(Duration(milliseconds: 200), () {
                    _controller.animateTo(200,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeInOut);
                  });
              },
              title: Text(
                'Gallery',
                style: TextStyle(color: color),
              ),
              children: (!isLoaded)
                  ? [
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: CircularProgressIndicator(),
                      )
                    ]
                  : (images.isEmpty
                      ? [
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Text(
                              'Sorry, there are no images for "${widget.cluster.cluster}" cluster',
                              style: TextStyle(color: color),
                            ),
                          )
                        ]
                      : images
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
                          .toList()),
            )
          ],
        ),
      ),
    );
  }
}

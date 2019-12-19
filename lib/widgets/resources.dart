import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_sastra_university/api/resourcesApi.dart';
import 'package:dsc_sastra_university/utility/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResourceCard extends StatelessWidget {
  ResourcesPODO _resource;

  ResourceCard(this._resource);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
      elevation: 4.0,
      child: InkWell(
        splashColor: Colors.grey.withAlpha(90),
        onTap: () {
          launchURL(_resource.url);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _resource.imageUrl == "" ? Container()
                : Image(
              image: CachedNetworkImageProvider(_resource.imageUrl),
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height / 5,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 16.0, bottom: 4.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  _resource.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              child: Text(
                _resource.description,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

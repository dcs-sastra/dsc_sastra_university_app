import 'package:app/constants.dart';
import 'package:app/models/cluster_model.dart';
import 'package:app/models/member_model.dart';
import 'package:app/screens/members/widgets/social_media_button.dart';
import 'package:app/services/database/members_collection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ClusterMembers extends StatelessWidget {
  final ClusterModel cluster;

  ClusterMembers(this.cluster);
  Color color, inverseColor;
  List<MemberModel> members = [];

  @override
  Widget build(BuildContext context) {
    color = getColor(context);
    inverseColor = getInverseColor(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        size24Box,
        Padding(
          padding: edgeInsets24Horizontal,
          child: Text(
            cluster.cluster,
            style: textStyleSize24Bold.copyWith(color: color),
          ),
        ),
        size24Box,
        Flexible(
          flex: 100,
          child: FutureBuilder<List<MemberModel>>(
            future: MemberCollection(cluster.image).fetchMembers(),
            builder: (_, ass) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 16),
                  if (ass.data != null && ass.data.isNotEmpty)
                    ...ass.data
                        .map(
                          (f) => InkWell(
                            onTap: () {
                              showBottomSheet(
                                  context: context,
                                  builder: (_) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: color,
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(16),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          SizedBox(
                                              width: double.maxFinite,
                                              height: 8),
                                          Container(
                                            height: 8,
                                            width: 48,
                                            decoration: BoxDecoration(
                                              color:
                                                  inverseColor.withOpacity(0.5),
                                              borderRadius: borderRadius8,
                                            ),
                                          ),
                                          size24Box,
                                          (f.socialMedia != null &&
                                                  f.socialMedia.isNotEmpty)
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: f.socialMedia.keys
                                                      .map((k) {
                                                    return SocialMediaIcon(
                                                      site: k,
                                                      link: f.socialMedia[k],
                                                    );
                                                  }).toList(),
                                                )
                                              : Text(
                                                  'Sorry no social media links available',
                                                  style: TextStyle(
                                                    color: inverseColor,
                                                  ),
                                                ),
                                          size24Box,
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Column(
                                children: <Widget>[
                                  Flexible(
                                    flex: 100,
                                    child: ClipOval(
                                      child: f.img == null
                                          ? Image.asset(
                                              'assets/placeholder.png')
                                          : CachedNetworkImage(imageUrl: f.img),
                                    ),
                                  ),
                                  size24Box,
                                  Text(
                                    f.name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: color,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  SizedBox(width: 16),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

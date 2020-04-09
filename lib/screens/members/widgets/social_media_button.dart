import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class SocialMediaIcon extends StatelessWidget {
  final String site, link;

  const SocialMediaIcon({
    Key key,
    @required this.site,
    @required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchURL(link),
      child: SvgPicture.asset(
        'assets/$site.svg',
        color: site == 'gh' ? getInverseColor(context) : null,
        height: 48,
      ),
    );
  }
}

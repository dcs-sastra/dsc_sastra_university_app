import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Team extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TeamState();
}

class _TeamState extends State<Team> {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}

Widget teamMemberWidget(BuildContext context, String name, String imageURL, String linkedInURL, String githubURL, String twitterURL, double dpsize){

  return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          elevation: 8.0,
          backgroundColor: Colors.white,
          builder: (_) {
            return Container(
              height: 100,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    onPressed: () async {
                      _launchURL(linkedInURL);
                    },
                    icon: Image.asset("assets/li.png"),
                  ),
                  IconButton(
                    onPressed: () async {
                      _launchURL(githubURL);
                    },
                    icon: SvgPicture.asset("assets/icons/gh.svg"),
                  ),
                  IconButton(
                    onPressed: () async {
                      _launchURL(twitterURL);
                    },
                    icon: Image.asset(
                      "assets/twitter.png",
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircleAvatar(
              foregroundColor: Colors.blueAccent,
              radius: dpsize / 1.9,
              backgroundImage: CachedNetworkImageProvider(imageURL),
            ),
            SizedBox(height: 8),

            Text(name,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
  );
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
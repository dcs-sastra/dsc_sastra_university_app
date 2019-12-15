import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'env.dart';

class TeamMemberPODO {
  String id, name, imageUrl, linkedin, github, twitter;

  TeamMemberPODO({
    @required this.id,
    @required this.name,
    @required this.imageUrl,
    @required this.linkedin,
    @required this.twitter,
    @required this.github,
  });

  @override
  String toString() {
    return """
      {
        id: $id,
        name: $name,
        url: $imageUrl,
        linkedin: $linkedin,
        github: $github,
        twitter: $twitter
      }
      """;
  }

  factory TeamMemberPODO.fromJson(Map<String, dynamic> parsedJson) {

    /*
      Check if team members data is available (This condition checks if team member's data is available).
      This condition doesn't satisfy the condition where name is available as any of the other field is not there.
    */
    if(parsedJson['name'] == null)
      return TeamMemberPODO(
          id: parsedJson['_id'],
          name: "",
          imageUrl: "",
          linkedin: "",
          github: "",
          twitter: "");
    else
      return TeamMemberPODO(
          id: parsedJson['_id'],
          name: parsedJson['name'],
          imageUrl: parsedJson['imgUrl'],
          linkedin: parsedJson['linkedin'],
          github: parsedJson['github'],
          twitter: parsedJson['twitter']);
  }
}

class TeamPODO {
  final String id;
  final TeamMemberPODO lead;
  Map<String, List<TeamMemberPODO>> clusterWiseTeamMembers;

  TeamPODO({
    @required this.id,
    @required this.lead,
    @required this.clusterWiseTeamMembers,
  });

  @override
  String toString() {
    return """
      {
        id: $id,
        lead: $lead,
        clusterWiseTeamMembers: $clusterWiseTeamMembers,
      }
      """;
  }

  factory TeamPODO.fromJson(Map<String, dynamic> parsedJson) {

    Map<String, List<TeamMemberPODO>> clusterWiseTeamMembers = new Map();

    var clusters = {
      "app": "Android Development",
      "flutter": "Flutter",
      "web": "Web Development",
      "ml": "Machine Learning",
      "cloud": "Cloud",
      "arvr": "AR/VR",
      "graphic": "Graphic Designing",
      "eventcoverage": "Event Coverage",
      "marketing": "Marketing and Corporate Relations",
      "content": "Content Writing",
    };

    for (MapEntry<String, String> item in clusters.entries) {
      print("Key");
      print(item.key);
      print("Item");
      print(item.value);
      var cluster = parsedJson[item.key] as List;
      print("Cluster");
      List<TeamMemberPODO> clusterMembers =
          cluster.map((member) => TeamMemberPODO.fromJson(member)).toList();
      print(clusterMembers);
      clusterWiseTeamMembers[item.value] = clusterMembers;
    }

    return TeamPODO(
        id: parsedJson['id'],
        lead: TeamMemberPODO.fromJson(parsedJson['lead']),
        clusterWiseTeamMembers: clusterWiseTeamMembers);
  }
}

class TeamApi {
  static getMembersList() async {
    Map<dynamic, dynamic> temp =
        jsonDecode((await http.get(teamMembersListURL)).body)[0];
    return TeamPODO.fromJson(temp);
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'env.dart';

class MemberPODO {
  String id, name, url;

  MemberPODO.fromMap(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    url = json["url"];
  }

  @override
  String toString() {
    return """
      {
        id: $id,
        name: $name,
        url: $url
      }
      """;
  }
}

class MemberApi {
  static getMembers() async {
    Map<dynamic, dynamic> temp =
        jsonDecode((await http.get(baseURL + "/MembersbyCluster")).body)[0];

    temp.remove("id");

    // print(temp);
    return temp;
  }
}

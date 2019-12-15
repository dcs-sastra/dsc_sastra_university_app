import 'dart:convert';

import 'package:http/http.dart' as http;
import 'env.dart';

class ClusterPODO {
  String id, name, img, backgroundColor, link, createdAt, updatedAt;

  ClusterPODO.fromMap(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    img = json["id"];
    backgroundColor = json["backgroundColor"];
    link = json["link"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
  }

  @override
  String toString() {
    return """
      {
        id: $id,
        name: $name,
        img: $img,
        backgroundColor: $backgroundColor,
        link: $link
      }
      """;
  }
}

class ClusterApi {
  static getClusters() async {
    List temp = jsonDecode((await http.get(clustersListURL)).body)
        .map((f) => ClusterPODO.fromMap(f))
        .toList();
    print(temp);
    return temp;
  }
}

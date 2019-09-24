import 'dart:convert';
import 'package:http/http.dart' as http;
import 'env.dart';

class EventPODO {
  String id,
      name,
      date,
      description,
      main,
      venue,
      speakers,
      poster,
      register_link,
      createdAt,
      updatedAt;

  EventPODO.fromMap(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    date = json["date"];
    description = json["description"];
    main = json["main"];
    venue = json["venue"];
    speakers = json["speakers"];
    poster = json["poster"];
    register_link = json["register_link"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
  }

  @override
  String toString() {
    return """
      {
        id: $id,
        name: $name,
        date: $date,
        description: $description,
        main: ${main.split(" ").toList().sublist(0, 10).toString().replaceAllMapped("[", (_) => "").replaceAllMapped("]", (_) => "").replaceAllMapped(",", (_) => "")}...,
        venue: $venue,
        speakers: $speakers,
        poster: $poster,
        register_link: $register_link,
        createdAt: $createdAt,
        updatedAt: $updatedAt,
      }
      """;
  }
}

class EventApi {
  static getEvents() async {
    List temp = jsonDecode((await http.get(baseURL + "/events")).body)
        .map((f) => EventPODO.fromMap(f))
        .toList();
    print(temp);
    return temp;
  }
}

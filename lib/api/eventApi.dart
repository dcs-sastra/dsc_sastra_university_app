import 'dart:convert';
import 'package:http/http.dart' as http;
import 'env.dart';

class EventPODO {
  String id, name, description, main, venue, speakers, poster, register_link;
  DateTime date, createdAt, updatedAt;

  EventPODO.fromMap(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    main = json["main"];
    venue = json["venue"];
    speakers = json["speakers"];
    poster = json["poster"];
    register_link = json["register_link"];
    date = parseDate(json["date"]);
    createdAt = parseDate(json["createdAt"]);
    updatedAt = parseDate(json["updatedAt"]);
  }

  DateTime parseDate(String dateStr) {
    return DateTime.parse(dateStr.substring(0, dateStr.length - 1));
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
  static Future<List<EventPODO>> getEvents() async {
    List tempList = jsonDecode((await http.get(baseURL + "/events")).body);
    List<EventPODO> events = [];
    for (var temp in tempList) {
      events.add(EventPODO.fromMap(temp));
    }
    events.sort((a, b) => a.date.difference(b.date).inHours);
    print(events);
    return events;
  }
}

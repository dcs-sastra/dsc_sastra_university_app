import 'package:dsc_sastra_university/api/Event.dart';
//class for representing List of events
class EventList{
  List<Event>eventList;
  EventList({this.eventList});

  factory EventList.fromJson(List<dynamic>jsonArray){
    List<Event>eventList = new List<Event>();

    eventList = jsonArray.map((event) => Event.fromJson(event)).toList();
    print(eventList[0].name + eventList[0].desc + eventList[0].date);
    return EventList(eventList: eventList);
  }
}
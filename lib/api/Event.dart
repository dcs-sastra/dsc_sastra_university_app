//class for representing Events
class Event{
  String name, desc, date, speakers;
  Event({this.name, this.desc, this.date, this.speakers});

  factory Event.fromJson(Map<String, dynamic> json){
    return Event(
      name: json['Name'],
      desc: json['Desc'],
      date: json['Date'],
      speakers: json['Speakers']
    );
  }
}
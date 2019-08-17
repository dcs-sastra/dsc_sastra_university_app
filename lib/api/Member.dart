//class for representing single member
class Member{
  String id, name, cluster, branch, imageURL;
  var links = new List(3);

  Member({this.id, this.name, this.cluster, this.branch, this.links, this.imageURL});

  factory Member.fromJson(Map<String, dynamic> json){
    //converting json object to dart object
    Member member =  Member(
      id: json['Id'],
      name: json['Name'],
      cluster: json['Team'],
      branch: json['Branch'],
      links: json['Links'].split("#"),
      imageURL: "http://dscsastra.herokuapp.com/images/"+json['Id']
    );
    print(member.imageURL);
    return member;
  }
}
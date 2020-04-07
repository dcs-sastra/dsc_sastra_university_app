class MemberModel {
  String name, img;
  Map<String, dynamic> socialMedia;

  MemberModel.fromMap(Map<String, dynamic> map) {
    print(map);
    name = map['name'];
    img = map['img'];
    socialMedia = map['sm'];
  }
}

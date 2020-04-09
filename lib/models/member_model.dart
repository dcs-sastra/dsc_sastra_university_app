class MemberModel {
  String name, img, id;
  Map<String, dynamic> socialMedia;

  MemberModel.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    img = map['img'];
    socialMedia = map['sm'];
  }
}

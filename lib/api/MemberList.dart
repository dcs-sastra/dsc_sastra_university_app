import 'package:dsc_sastra_university/api/Member.dart';
import 'package:flutter/material.dart';

//class for representing List of members
class MemberList {
  List<Member> members;

  MemberList({this.members});

  factory MemberList.fromJson(List<dynamic> jsonArray) {
    List<Member> memberList = new List<Member>();
    memberList = jsonArray.map((member) => Member.fromJson(member)).toList();
    return MemberList(members: memberList);
  }
}

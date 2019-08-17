import 'package:dsc_sastra_university/api/Member.dart';
import 'package:flutter/material.dart';
//class for representing List of members
class MemberList{
  List<Member> members;

  MemberList({this.members});

  factory MemberList.fromJson(List<dynamic> jsonArray){
    List<Member> memberList = new List<Member>();
    //convert json array into list of objects
    memberList = jsonArray.map((member) => Member.fromJson(member)).toList();
    debugPrint("Member List"+ memberList[0].name);
    return MemberList(members:memberList);
  }
}
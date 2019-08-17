import 'dart:async';
import 'dart:convert';
import 'package:dsc_sastra_university/api/EventList.dart';
import 'package:dsc_sastra_university/api/Member.dart';
import 'package:dsc_sastra_university/api/MemberList.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class APIHelper{
  String baseURL = "http://dscsastra.herokuapp.com";

  //returns list of all members
  Future<MemberList> getAllMembers() async{
    String url = baseURL + '/members';
    final response = await http.get(url, headers: {"Accept":"application/json"});

    if(response.statusCode == 200){
      return MemberList.fromJson(json.decode(response.body));
    }else{
      debugPrint("Member List fetch FAILED:");
      throw Exception();
    }
  }
  //returns member with given id
  Future<Member> getMember(int id) async{
    String url = baseURL + '/members/' + id.toString();
    final response = await http.get(url, headers: {"Accept": "application/json"});
    
    if(response.statusCode == 200){
      return Member.fromJson(json.decode(response.body));
    }else{
      debugPrint("Member fetch Failed");
      throw Exception();
    }
  }

  Future<EventList> getEvents() async{
    String url = baseURL + '/events';
    final response = await http.get(url, headers: {"Accept":"application/json"});

    if(response.statusCode == 200){
      return EventList.fromJson(json.decode(response.body));
    }else{
      debugPrint("Event fetch Failed");
      throw Exception();
    }
  }

  Future<bool> postContactForm(String email, String phone, String msg) async{

    Map data = {
      "email":email,
      "phone":phone,
      "message":msg
    };
    var jsonBody = jsonEncode(data);
    print(jsonBody);
    String url = baseURL + '/contact';
    final response = await http.post(url, headers: {"Accept":"applications/json"}, body:jsonBody);
    if(response.statusCode == 200){
      var jsonResponse = json.decode(response.body);
      if(jsonResponse['Status'] == "Success"){
        print("success");
        return true;
      }else{
        print("failure");
        return false;
      }
    }else{
      return false;
    }
  }

}
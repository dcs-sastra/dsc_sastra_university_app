import 'package:flutter/cupertino.dart';

class UserModel {
  String name, email, phoneNumber, year;

  UserModel({
    this.name,
    this.email,
    this.year,
    this.phoneNumber,
  });

  UserModel.fromMap(Map<String, String> user) {
    name = user['n'];
    email = user['e'];
    year = user['y'];
    phoneNumber = user['p'];
  }

  Map<String, String> toMap() {
    Map<String, String> temp = {
      'n': name,
      'e': email,
      'y': year,
    };
    if (phoneNumber != null) {
      temp['p'] = phoneNumber;
    }
    return temp;
  }
}

enum Gender { MALE, FEMALE }

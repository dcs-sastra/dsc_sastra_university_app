import 'package:app/constants.dart';
import 'package:app/models/user_model.dart';
import 'package:app/services/auth.dart';
import 'package:app/services/database/user_collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  UserModel userModel = UserModel();
  FirebaseUser firebaseUser;

  @override
  void initState() {
    firebaseUser = ModalRoute.of(context).settings.arguments;
    userModel.name = firebaseUser.displayName;
    userModel.email = firebaseUser.email;
    userModel.phoneNumber = firebaseUser.phoneNumber;
    userModel.year = (firebaseUser.email.contains('sastra.ac.in')
            ? 4 -
                (int.parse(firebaseUser.email.substring(1, 3)) +
                    2000 -  
                    DateTime.now().year)
            : 0)
        .toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'Signup',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                initialValue: firebaseUser.displayName,
                onChanged: (val) => userModel.name = val,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
              size24Box,
              TextFormField(
                initialValue: firebaseUser.email,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              size24Box,
              TextFormField(
                initialValue: firebaseUser.phoneNumber,
                onChanged: (val) => userModel.phoneNumber = val,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number (Optional)',
                ),
              ),
              size24Box,
              Container(
                width: double.maxFinite,
                child: DropdownButton<int>(
                    value: int.parse(userModel.year),
                    items: [0, 1, 2, 3, 4, 5]
                        .map(
                          (f) => DropdownMenuItem(
                            child: Text(numToName(f)),
                            value: f,
                          ),
                        )
                        .toList(),
                    onChanged: (i) {
                      setState(() {
                        userModel.year = i.toString();
                      });
                    }),
              ),
              size24Box,
              size24Box,
              GestureDetector(
                onTap: () async {
                  if (userModel.year == '0') {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('Invalid Year'),
                        content: Text('Select year of study'),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('Okay'),
                          )
                        ],
                      ),
                    );
                  } else {
                    await UserCollection().updateUser(userModel.toMap());
                    await AuthService().cacheUser(userModel.toMap());
                    Navigator.of(context).pushNamed('/home');
                  }
                },
                child: Container(
                  height: 64,
                  width: double.maxFinite,
                  color: Colors.black,
                  alignment: Alignment.center,
                  child: Text(
                    'Get Started',
                    style: textStyle18.copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String numToName(int f) {
    switch (f) {
      case 1:
        return 'First Year';
      case 2:
        return 'Second Year';
      case 3:
        return 'Third Year';
      case 4:
        return 'Fourth Year';
      case 5:
        return 'Fifth Year';
      default:
        return 'Select year of study';
    }
  }
}

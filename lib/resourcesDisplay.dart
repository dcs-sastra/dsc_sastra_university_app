import 'package:after_layout/after_layout.dart';
import 'package:dsc_sastra_university/api/resourcesApi.dart';
import 'package:dsc_sastra_university/widgets/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Resources extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> with AfterLayoutMixin {
  List<Widget> resourcesList = [];
  bool isLoaded = false;

  @override
  void afterFirstLayout(BuildContext context) async {
    resourcesList = (await ResourcesApi.getResourcesList())
        .map((f) => ResourceCard(f))
        .toList();
    print("resourcesList.length");
    print(resourcesList.length);
    isLoaded = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 2,
          centerTitle: false,
          title: Text(
            "Resources",
            style: TextStyle(
                fontSize: 20,
                fontFamily: "Product Sans",
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        body: isLoaded ? ListView.builder(
          itemCount: resourcesList.length,
          itemBuilder: (buildContext, i) => resourcesList[i],
          physics: BouncingScrollPhysics(),
        )
            : Center(
          child: CircularProgressIndicator(),
        )
    );
  }
}

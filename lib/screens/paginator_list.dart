import 'package:after_layout/after_layout.dart';
import 'package:app/models/model_structure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:app/constants.dart';

class PaginatorList<T extends ModelStructure<T>> extends StatefulWidget {
  final Future<List<DocumentSnapshot>> Function(
      {DocumentSnapshot documentSnapshot}) fetch;
  final Widget Function(T) builder;
  final T instance;
  final Function getLength;

  const PaginatorList({
    Key key,
    @required this.fetch,
    @required this.builder,
    @required this.instance,
    @required this.getLength,
  }) : super(key: key);
  @override
  _PaginatorListState createState() =>
      _PaginatorListState<T>(fetch, builder, getLength);
}

class _PaginatorListState<T extends ModelStructure<T>>
    extends State<PaginatorList> with AfterLayoutMixin {
  DocumentSnapshot lastDoc;
  List<dynamic> tModel = [null];
  List<String> docsIds = [];

  final Widget Function(T) builder;
  final Future<List<DocumentSnapshot>> Function(
      {DocumentSnapshot documentSnapshot}) fetch;
  final Function getLength;

  ScrollController _controller;

  int last = 0;

  _PaginatorListState(
    this.fetch,
    this.builder,
    this.getLength,
  );
  int count;

  @override
  void initState() {
    _controller = ScrollController();
    // _controller.addListener(() {
    //   print('Listening');
    //   if ((!docsIds.contains(lastDoc.documentID)) &&
    //       (docsIds.length - last) <= 1) {
    //     print('Listened');
    //     setState(() {
    //       lastDoc = lastDoc;
    //     });
    //   }
    // });
    super.initState();
  }

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    count = await getLength();
    setState(() {
      tModel = tModel;
      count = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DocumentSnapshot>>(
      initialData: [],
      future: fetchDocs(),
      builder: (_, ass) {
        if (tModel.isNotEmpty) tModel.removeLast();
        if (ass.data.isNotEmpty) {
          lastDoc = ass.data.last;
        }
        ass.data.forEach(
          (f) {
            if (!docsIds.contains(f.documentID)) {
              docsIds.add(f.documentID);
              tModel.add(widget.instance.fromDocumentSnapshot(f));
            }
          },
        );
        tModel.add(null);

        return NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollUpdateNotification) {
              {
                if ((tModel.length - last) <= (paginationLimit + 1)) {
                  setState(() {
                    lastDoc = lastDoc;
                  });
                }
              }
            }
            return false;
          },
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: tModel.length + 1,
            controller: _controller,
            scrollDirection: Axis.horizontal,
            addAutomaticKeepAlives: false,
            itemBuilder: (_, i) {
              if (i == 0) return size24Box;
              --i;
              last = i;
              if (tModel[i] == null) {
                if (count != null && count == (tModel.length - 1))
                  return size24Box;
                else
                  return Padding(
                    padding: edgeInsets24Horizontal,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
              }
              return builder(tModel[i]);
            },
          ),
        );
      },
    );
  }

  Future<List<DocumentSnapshot>> fetchDocs() async {
    List<DocumentSnapshot> temp = await fetch(documentSnapshot: lastDoc);
    return temp ?? [];
  }
}

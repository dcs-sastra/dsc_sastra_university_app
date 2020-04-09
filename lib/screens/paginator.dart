import 'package:after_layout/after_layout.dart';
import 'package:app/models/model_structure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:app/constants.dart';

class Paginator<T extends ModelStructure<T>> extends StatefulWidget {
  final Future<List<DocumentSnapshot>> Function(
      {DocumentSnapshot documentSnapshot}) fetch;
  final Widget Function(T) builder;
  final T instance;

  const Paginator({
    Key key,
    @required this.fetch,
    @required this.builder,
    @required this.instance,
  }) : super(key: key);
  @override
  _PaginatorState createState() => _PaginatorState<T>(fetch, builder);
}

class _PaginatorState<T extends ModelStructure<T>> extends State<Paginator>
    with AfterLayoutMixin {
  DocumentSnapshot lastDoc;
  List<dynamic> tModel = [];
  List<String> docsIds = [];

  final Widget Function(T) builder;
  final Future<List<DocumentSnapshot>> Function(
      {DocumentSnapshot documentSnapshot}) fetch;

  _PaginatorState(this.fetch, this.builder);

  @override
  void afterFirstLayout(BuildContext context) {
    setState(() {
      tModel = tModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DocumentSnapshot>>(
      initialData: [],
      future: fetch(documentSnapshot: lastDoc),
      builder: (_, ass) {
        ass.data.forEach(
          (f) {
            if (!docsIds.contains(f.documentID)) {
              docsIds.add(f.documentID);
              tModel.add(widget.instance.fromDocumentSnapshot(f));
            }
          },
        );
        return PageView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: tModel.length,
          onPageChanged: (i) {
            if ((i % paginationLimit == 1) && ((tModel.length - i) <= 1)) {
              setState(() {
                lastDoc = ass.data[i];
              });
            }
          },
          itemBuilder: (_, i) {
            return builder(tModel[i]);
          },
        );
      },
    );
  }
}

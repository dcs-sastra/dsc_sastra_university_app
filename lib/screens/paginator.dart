import 'package:app/models/model_structure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:app/constants.dart';

class Paginator<T extends ModelStructure<T>> extends StatefulWidget {
  final Future<List<DocumentSnapshot>> Function(
      {DocumentSnapshot documentSnapshot}) fetch;
  final Widget Function(T) builder;

  const Paginator({Key key, @required this.fetch, @required this.builder})
      : super(key: key);
  @override
  _PaginatorState createState() => _PaginatorState<T>(fetch, builder);
}

class _PaginatorState<T extends ModelStructure<T>> extends State<Paginator> {
  DocumentSnapshot lastDoc;
  List<T> tModel = [];

  final Widget Function(T) builder;
  final Future<List<DocumentSnapshot>> Function(
      {DocumentSnapshot documentSnapshot}) fetch;

  _PaginatorState(this.fetch, this.builder);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DocumentSnapshot>>(
      initialData: [],
      future: fetch(documentSnapshot: lastDoc),
      builder: (_, ass) {
        setState(() {
          tModel.addAll(ass.data
              .map((f) => (T as ModelStructure<T>).fromDocumentSnapshot(f))
              .toList());
        });
        return PageView.builder(
          itemCount: tModel.length,
          itemBuilder: (_, i) {
            if ((i % paginationLimit == 0) && ((tModel.length - i) == 1)) {
              setState(() {
                lastDoc = ass.data.last;
              });
            }

            return builder(tModel[i]);
          },
        );
      },
    );
  }
}

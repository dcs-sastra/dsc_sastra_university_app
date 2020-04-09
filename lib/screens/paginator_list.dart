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

  const PaginatorList({
    Key key,
    @required this.fetch,
    @required this.builder,
    @required this.instance,
  }) : super(key: key);
  @override
  _PaginatorListState createState() => _PaginatorListState<T>(fetch, builder);
}

class _PaginatorListState<T extends ModelStructure<T>>
    extends State<PaginatorList> with AfterLayoutMixin {
  DocumentSnapshot lastDoc;
  List<dynamic> tModel = [];
  List<String> docsIds = [];

  final Widget Function(T) builder;
  final Future<List<DocumentSnapshot>> Function(
      {DocumentSnapshot documentSnapshot}) fetch;

  ScrollController _controller;

  int last = 0;

  _PaginatorListState(this.fetch, this.builder);

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
  void afterFirstLayout(BuildContext context) {
    setState(() {
      tModel = tModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DocumentSnapshot>>(
      initialData: [],
      future: fetchDocs(),
      builder: (_, ass) {
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
        return NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollUpdateNotification) {
              {
                if ((tModel.length - last) <= (paginationLimit + 1)
                    // &&
                    //     (!docsIds.contains(lastDoc.documentID))
                    ) {
                  // print('Listened');
                  setState(() {
                    lastDoc = lastDoc;
                  });
                }
              }
            }
          },
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: tModel.length,
            controller: _controller,
            scrollDirection: Axis.horizontal,
            addAutomaticKeepAlives: false,
            itemBuilder: (_, i) {
              // print('########');
              // print('$i ${tModel.length} $last');
              last = i;
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

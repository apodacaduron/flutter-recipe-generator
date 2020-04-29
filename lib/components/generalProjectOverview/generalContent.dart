import 'package:flutter/material.dart';

class GeneralContent extends StatelessWidget {
  final Map project;
  final List data;
  GeneralContent({this.project, this.data});

  getStat(e) {
    if (e['isNested'].toString() != 'null' && e['isNested']) {
      if (project[e['column']] != null) {
        return project[e['column']][e['nestedColumn']];
      }
      return null;
    }
    return project[e['column']];
  }

  generateCards() {
    return data
        .map(
          (e) => GeneralCard(
            title: e['title'],
            stat: getStat(e),
            isDate: e['isDate'] ?? false,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              GeneralHeader(project),
              ...generateCards(),
            ],
          ),
        ),
      ],
    );
  }
}

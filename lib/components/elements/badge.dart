import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color background;
  final Color color;

  Badge({
    this.title,
    this.subtitle,
    this.background = const Color.fromRGBO(0, 0, 0, 0),
    this.color = const Color.fromRGBO(0, 0, 0, 0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
      child: Column(children: <Widget>[
        Text(
          title,
          style: TextStyle(color: color, fontSize: 11),
        ),
        subtitle != null
            ? Text(
                subtitle,
                style: TextStyle(color: color, fontSize: 11),
              )
            : SizedBox(),
      ]),
    );
  }
}

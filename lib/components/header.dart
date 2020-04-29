import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final String subtitle;
  final double subSize;

  Header({this.title = '', this.subtitle = '', this.subSize = 15});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, height: 1),
              ),
            ),
            subtitle != '' ? Align(
              alignment: Alignment.centerLeft,
              child: Text(
                subtitle,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: subSize,
                  height: 1
                ),
              ),
            ) : SizedBox(),
            SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  final String title;
  final String text;

  Alert({ this.title, this.text });

  @override
  Widget build(BuildContext context) {
    return Container(child:
      AlertDialog(
        title: Text(title),
        content: Text(text)
      ),
    );
  }
}
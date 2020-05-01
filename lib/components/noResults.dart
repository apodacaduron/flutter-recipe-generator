import 'package:flutter/material.dart';

class NoResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Image.asset(
          'lib/assets/no_results.png',
          fit: BoxFit.contain,
        ),
        Text('No Results',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text('There are no recipes available at the moment.'),
      ],
    ));
  }
}

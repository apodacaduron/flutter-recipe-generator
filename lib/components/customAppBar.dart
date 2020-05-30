import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String text1;
  final String text2;

  CustomAppBar({this.text1 = '', this.text2 = ''});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 80, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 10,),
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back),
            tooltip: 'Go back to recipes list',
            onPressed: () => Navigator.pop(context),
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  text1,
                  style: TextStyle(color: Colors.grey, fontSize: 22),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  text2,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 32),
                ),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.fastfood),
            tooltip: 'Go back to recipes list',
            onPressed: () => Navigator.pop(context),
          ),
          SizedBox(width: 10,),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function click;
  final String text;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final bool borderOnly;

  Button({
    this.click,
    this.text,
    this.color = const Color.fromRGBO(237, 28, 36, 1),
    this.textColor = const Color.fromRGBO(237, 28, 36, 1),
    this.borderColor = const Color.fromRGBO(237, 28, 36, 1),
    this.borderOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Material(
        elevation: 5.0,
        borderRadius: new BorderRadius.circular(5.0),
        child: !borderOnly
            ? MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0),
                ),
                onPressed: click,
                color: color,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            : ButtonTheme(
                minWidth: MediaQuery.of(context).size.width,
                child: OutlineButton(
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                  ),
                  onPressed: click,
                  color: color,
                  borderSide: BorderSide(
                    color: borderColor, //Color of the border
                    style: BorderStyle.solid, //Style of the border
                    width: 1, //width of the border
                  ),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: textColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
      ),
    );
  }
}

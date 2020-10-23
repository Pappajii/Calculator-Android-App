import 'package:flutter/material.dart';

class CalcBut extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function callback;
  const CalcBut({
    Key key,
    this.fillColor,
    this.text,
    this.textColor,
    this.textSize = 24,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: SizedBox(
        height: 65,
        width: 65,
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Text(
            text,
            style: TextStyle(
              color: Color(textColor),
              fontSize: textSize,
              fontFamily: "Quicksand",
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            callback(text);
          },
          color: fillColor != null ? Color(fillColor).withOpacity(0.5) : null,
        ),
      ),
    );
  }
}

import 'package:calcapp/calcButton.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _expression = '';
  String _history = '';

  void numClick(String text) {
    setState(() {
      _expression = _expression + text;
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void allClear(String text) {
    setState(() {
      _expression = '';
      _history = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      home: Scaffold(
        backgroundColor: Color(0xff555A60),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(left: 40, right: 40, top: 40),
              child: Text(
                _history,
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              alignment: Alignment(1, 1),
            ),
            Container(
              padding: EdgeInsets.only(left: 40, right: 40, bottom: 40),
              child: Text(
                _expression,
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              alignment: Alignment(1, 1),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcBut(
                  text: "AC",
                  textColor: 0xffF4AB41,
                  callback: allClear,
                  //fillColor: 0xFFFFFFFF,
                ),
                CalcBut(
                  text: "C",
                  textColor: 0xffF4AB41,
                  callback: clear,
                  //fillColor: 0xFFFFFFFF,
                ),
                CalcBut(
                  text: "%",
                  textColor: 0xffecf0f1,
                  fillColor: 0xffF4AB41,
                  callback: numClick,
                ),
                CalcBut(
                  text: "/",
                  textColor: 0xffecf0f1,
                  fillColor: 0xffF4AB41,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcBut(
                  text: "7",
                  textColor: 0xffffffff,
                  callback: numClick,
                  // fillColor: 0xFFFFFFFF,
                ),
                CalcBut(
                  text: "8",
                  textColor: 0xffffffff,
                  //fillColor: 0xFFFFFFFF,
                  callback: numClick,
                ),
                CalcBut(
                  text: "9",
                  textColor: 0xffffffff,
                  //fillColor: 0xFFFFFFFF,
                  callback: numClick,
                ),
                CalcBut(
                  text: "*",
                  textColor: 0xffecf0f1,
                  fillColor: 0xffF4AB41,
                  textSize: 50.0,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcBut(
                  text: "4",
                  textColor: 0xffffffff,
                  //fillColor: 0xFFFFFFFF,
                  callback: numClick,
                ),
                CalcBut(
                  text: "5",
                  textColor: 0xffffffff,
                  //fillColor: 0xFFFFFFFF,
                  callback: numClick,
                ),
                CalcBut(
                  text: "6",
                  textColor: 0xffffffff,
                  //fillColor: 0xFFFFFFFF,
                  callback: numClick,
                ),
                CalcBut(
                  text: "-",
                  callback: numClick,
                  textColor: 0xffecf0f1,
                  fillColor: 0xffF4AB41,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcBut(
                  text: "1",
                  textColor: 0xffffffff,
                  //fillColor: 0xFFFFFFFF,
                  callback: numClick,
                ),
                CalcBut(
                  text: "2",
                  textColor: 0xffffffff,
                  //fillColor: 0xFFFFFFFF,
                  callback: numClick,
                ),
                CalcBut(
                  text: "3",
                  textColor: 0xffffffff,
                  //fillColor: 0xFFFFFFFF,
                  callback: numClick,
                ),
                CalcBut(
                  text: "+",
                  textColor: 0xffecf0f1,
                  fillColor: 0xffF4AB41,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcBut(
                  text: ".",
                  textColor: 0xffffffff,
                  //fillColor: 0xFFFFFFFF,
                  callback: numClick,
                ),
                CalcBut(
                  text: "0",
                  textColor: 0xffffffff,
                  //fillColor: 0xFFFFFFFF,
                  callback: numClick,
                ),
                CalcBut(
                  text: "00",
                  textColor: 0xffffffff,
                  //fillColor: 0xFFFFFFFF,
                  callback: numClick,
                ),
                CalcBut(
                  text: "=",
                  textColor: 0xffecf0f1,
                  fillColor: 0xffF4AB41,
                  callback: evaluate,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

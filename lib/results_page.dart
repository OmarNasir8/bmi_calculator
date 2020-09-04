import 'package:flutter/material.dart';
import 'constants.dart';
import 'input_page.dart';


// ignore: must_be_immutable
class ResultsPage extends StatelessWidget {

  ResultsPage({this.bmiResult, this.resultText, this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  InputPage ip = new InputPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OMAR\'S BMI CALCULATOR"),
        centerTitle: true
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text("Your Result", style: TitleTextStyle),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(color: expColor, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: TextStyle(
                      color: Color(0xFF24D876),
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    bmiResult,
                    style: TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold)
                  ),
                  Text(
                      interpretation,
                      style: TextStyle(fontSize: 22.0),
                      textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          ip.BottomButton(GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(child: Text("RECALCULATE", style: largeButtonTextStyle)),
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 80,
              padding: EdgeInsets.only(bottom: 10),
            ),
          ),
          ),
        ],
      ),
    );
  }
}

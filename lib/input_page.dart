import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'results_page.dart';
import 'package:bmicalculator/calculator_brain.dart';

//Author: Omar Nasir

enum genderType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();

  GestureDetector BottomButton(GestureDetector gestureDetector) {
    GestureDetector mG = gestureDetector;
    return mG;
  }
}

class _InputPageState extends State<InputPage> {

  InputPage ip = new InputPage();

  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  int height = 180;
  int weight = 60;
  int age = 18;

  //1 = male, 2 = female
  void updateTheColor(genderType gender) {
    gender == genderType.male ? maleCardColor = expColor : maleCardColor = inactiveCardColor;
    gender == genderType.male ? femaleCardColor = inactiveCardColor : maleCardColor = inactiveCardColor;
    gender == genderType.female ? femaleCardColor = expColor : femaleCardColor = inactiveCardColor;
    gender == genderType.female ? maleCardColor = inactiveCardColor : femaleCardColor = inactiveCardColor;
    }

    // ignore: non_constant_identifier_names
    Expanded addBoxW(Color color, String WorA) {
      return Expanded(
        child: Container(
          margin: EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(WorA, style: labelTextStyle),
              Text(weight.toString(), style: boldTextStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RoundIconButton(
                      icon: FontAwesomeIcons.minus,
                      onPressed: () {
                        setState(() {
                          weight--;
                        });
                      },
                  ),
                  SizedBox(width: 10),
                  RoundIconButton(
                      icon: FontAwesomeIcons.plus,
                      onPressed: () {
                        setState(() {
                          weight++;
                        });
                      },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

  // ignore: non_constant_identifier_names
  Expanded addBoxA(Color color, String WorA) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(WorA, style: labelTextStyle),
            Text(age.toString(), style: boldTextStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundIconButton(
                  icon: FontAwesomeIcons.minus,
                  onPressed: () {
                    setState(() {
                        age--;
                    });
                  },
                ),
                SizedBox(width: 10),
                RoundIconButton(
                  icon: FontAwesomeIcons.plus,
                  onPressed: () {
                    setState(() {
                        age++;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

    Expanded addBoxSlider(Color color) {
          return Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "HEIGHT",
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: boldTextStyle,
                      ),
                      Text("cm", style: labelTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30)
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
            ),
          );
    }


    Expanded addBoxGender(Color colour, Widget cardChild, genderType gender) {
      return Expanded(child: GestureDetector(
        onTap: () {
          setState(() {
            updateTheColor(gender);
          });
        },
        child: Container(
          child: cardChild,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(color: colour, borderRadius: BorderRadius.circular(10)),
        ),
      ),
      );
    }


    Column addMaF(String mof, IconData mofPic) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            mofPic,
            size: 80,
          ),
          SizedBox(
            height: 15,
          ),
          Text(mof, style: labelTextStyle)
        ],
      );
    }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('OMAR\'S BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: Row(
              children: <Widget>[
                addBoxGender(maleCardColor, addMaF("MALE", FontAwesomeIcons.mars), genderType.male),
                addBoxGender(femaleCardColor, addMaF("FEMALE", FontAwesomeIcons.venus), genderType.female)
              ],
            )),
            addBoxSlider(expColor),
            Expanded(child: Row(
              children: <Widget>[
                addBoxW(expColor, "WEIGHT"),
                addBoxA(expColor, "AGE")
              ],
            )),
            ip.BottomButton(GestureDetector(
              onTap: () {

                CalculatorBrain calc = new CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation()
                    ))
                );
              },
              child: Container(
                child: Center(child: Text("CALCULATE", style: largeButtonTextStyle)),
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

    // ignore: non_constant_identifier_names

}

class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

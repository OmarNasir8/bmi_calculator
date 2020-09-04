import 'dart:math';

class CalculatorBrain {

  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;
  double bmi;

  String calculateBMI() {
    bmi = weight / pow(height/100,2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
      if(bmi >= 25) {
        return "Overweight";
      } else if (bmi > 18.5) {
        return "Normal";
      } else if (bmi > 0) {
        return "Underweight";
      } else {
        return "Nonce";
      }
  }

  String getInterpretation() {
    if(bmi >= 25) {
      return "Your body weight is high, stop eating cheese burgers!";
    } else if (bmi > 18.5) {
      return "Well done!, you're normal";
    } else if (bmi > 0) {
      return "Your body weight is low, eat a cheese burger!";
    } else {
      return "Your just dumb fam";
    }
  }

}
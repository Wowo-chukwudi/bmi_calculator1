import 'dart:math';

class BmiCalculate {
  final int weight;
  final int height;

  BmiCalculate({required this.weight, required this.height});

  double bmi = 0.0;

  String calculateBmi() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi <= 18.5) {
      return 'Underweight';
    } else if (bmi >= 24.9) {
      return 'Healthy Weight';
    } else if (bmi >= 29.9) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }

  String getMessage() {
    if (bmi < 18.5) {
      return 'You are underweight, please eat';
    } else if (bmi >= 24.9) {
      return 'You have a normal body weight. Good job';
    } else if (bmi >= 29.9) {
      return 'You have a higher than normal body weight. Exercise more';
    } else {
      return 'Stop eating fatsooooo';
    }
  }
}

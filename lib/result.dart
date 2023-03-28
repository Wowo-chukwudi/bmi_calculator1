import 'package:bmi_calculator/bmi_calculate.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reuse/reusable.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/input_page.dart';

class ResultPage extends StatelessWidget {
  final String bmiText;
  final String bmiResult;
  final String bmiMessage;
  const ResultPage(
      {super.key,
      required this.bmiText,
      required this.bmiResult,
      required this.bmiMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'BMI Calculator',
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                child: const Text(
                  'Your Result',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: ReusableCard(
                colour: cardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      bmiText.toUpperCase(),
                      style: const TextStyle(
                          color: Color(0XFF24D876),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      bmiResult,
                      style: const TextStyle(
                          fontSize: 80, fontWeight: FontWeight.w900),
                    ),
                    Text(
                      bmiMessage,
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: pinkColor,
              margin: const EdgeInsets.only(top: 10),
              height: bottomContainerHeight,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'RE-CALCULATE YOUR BMI',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ));
  }
}

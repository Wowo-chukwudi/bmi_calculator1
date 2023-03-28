import 'package:bmi_calculator/bmi_calculate.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/my_routes.dart';
import 'package:bmi_calculator/result.dart';
import 'package:bmi_calculator/reuse/gender_card.dart';
import 'package:bmi_calculator/reuse/reusable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Genders { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Genders? genderSelected;
  int height = 150;
  int weight = 60;
  int age = 24;

  Color femaleCardColor = inactiveCardColor;

  // void genderSelected(Genders gender) {
  //   if (gender == male) {
  //     if (maleCardColor == inactiveCardColor) {
  //       maleCardColor = cardColor;
  //       femaleCardColor = inactiveCardColor;
  //     } else {
  //       maleCardColor = inactiveCardColor;
  //     }
  //   } else {
  //     if (femaleCardColor == inactiveCardColor) {
  //       femaleCardColor = cardColor;
  //       maleCardColor = inactiveCardColor;
  //     } else {
  //       femaleCardColor = inactiveCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Color maleCardColor =
        genderSelected == Genders.male ? cardColor : inactiveCardColor;
    Color femaleCardColor =
        genderSelected == Genders.female ? cardColor : inactiveCardColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        genderSelected = Genders.male;
                      });
                    },
                    child: ReusableCard(
                        colour: maleCardColor,
                        cardChild: const GenderCard(
                            gender: 'MALE', icon: FontAwesomeIcons.mars)),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        genderSelected = Genders.female;
                      });
                    },
                    child: ReusableCard(
                      colour: femaleCardColor,
                      cardChild: const GenderCard(
                        gender: 'FEMALE',
                        icon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: cardColor,
              cardChild: Container(
                margin: const EdgeInsets.only(top: 7),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'HEIGHT',
                        style: genderTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text(
                            height.toString(),
                            style: restOfCardTextStyle,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const Text(
                            'cm',
                            style: genderTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: const SliderThemeData(
                          trackHeight: 4,
                          activeTrackColor: Colors.white,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                          overlayColor: Color(0X29EB1555),
                          thumbColor: pinkColor,
                          inactiveTrackColor: Color(0XFF8D8E98),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.toInt();
                            });
                          },
                          min: 100.0,
                          max: 350,
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: cardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: genderTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: restOfCardTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              iconPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              iconPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: cardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: genderTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: restOfCardTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              iconPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              iconPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: pinkColor,
            margin: const EdgeInsets.only(top: 10),
            height: bottomContainerHeight,
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                BmiCalculate calculation =
                    BmiCalculate(weight: weight, height: height);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiText: calculation.getResult(),
                      bmiResult: calculation.calculateBmi(),
                      bmiMessage: calculation.getMessage(),
                    ),
                  ),
                );
              },
              child: const Text(
                'CALCULATE',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function() iconPress;

  const RoundIconButton(
      {super.key, required this.icon, required this.iconPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6,
      constraints: const BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
      ),
      shape: CircleBorder(),
      onPressed: iconPress,
      fillColor: const Color(0XFF4C4F5E),
      child: Icon(icon),
    );
  }
}

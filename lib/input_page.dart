import 'package:bmi_calculator/constants.dart';
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
                    cardChild: Column(),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: cardColor,
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
          )
        ],
      ),
    );
  }
}

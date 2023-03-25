import 'package:bmi_calculator/reuse/gender_card.dart';
import 'package:bmi_calculator/reuse/reusable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const double bottomContainerHeight = 55;
const cardColor = Color(0XFF1D1E33);
const inactiveCardColor = Color(0XFF111328);
const pinkColor = Color(0XFFEB1555);

enum Genders { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  Genders male = Genders.male;
  Genders female = Genders.female;

  void genderSelected(Genders gender) {
    if (gender == male) {
      if (maleCardColor == inactiveCardColor) {
        maleCardColor = cardColor;
        femaleCardColor = inactiveCardColor;
      } else {
        maleCardColor = inactiveCardColor;
      }
    } else {
      if (femaleCardColor == inactiveCardColor) {
        femaleCardColor = cardColor;
        maleCardColor = inactiveCardColor;
      } else {
        femaleCardColor = inactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        genderSelected(male);
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
                        genderSelected(female);
                      });
                    },
                    child: ReusableCard(
                      colour: femaleCardColor,
                      cardChild: const GenderCard(
                        gender: 'FEMALEE',
                        icon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: ReusableCard(
              colour: cardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: ReusableCard(
                    colour: cardColor,
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

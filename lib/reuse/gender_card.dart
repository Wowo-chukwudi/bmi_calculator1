import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  final String gender;
  final IconData icon;
  const GenderCard({
    super.key,
    required this.gender,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 70,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          gender,
          style: genderTextStyle,
        ),
      ],
    );
  }
}

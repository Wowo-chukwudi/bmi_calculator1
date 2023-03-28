import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';

const String homepage = '/';
const String resultPage = '/secondPage';

class MyRoutes {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case homepage:
        return MaterialPageRoute(builder: (context) => const InputPage());

      // case resultPage:

      //   return MaterialPageRoute(builder: (context) =>  ResultPage());
      default:
    }
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text('No Route Found'),
        ),
      ),
    );
  }
}

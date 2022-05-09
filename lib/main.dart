import 'inputpage.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF222222),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff0a0e21),
        ),
        accentColor: Color.fromARGB(255, 118, 61, 182),
        scaffoldBackgroundColor: Color.fromARGB(255, 5, 5, 49),
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
      ),
      home: InputPage(),
    );
  }
}

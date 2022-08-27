import 'package:flutter/material.dart';
import 'package:pluralsight_course_1/screens/bmi_calculator.dart';
import 'package:pluralsight_course_1/screens/intro_screen.dart';
import 'package:pluralsight_course_1/screens/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Globe Fitness App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: '/',
      routes: {
        '/': ((context) => const IntroScreen()),
        '/bmi': ((context) => BmiScreen()),
        '/weather': ((context) => WeatherScreen()),
      },
    );
  }
}

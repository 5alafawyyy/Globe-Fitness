import 'package:flutter/material.dart';
import 'package:pluralsight_course_1/screens/bmi_calculator.dart';
import 'package:pluralsight_course_1/screens/intro_screen.dart';
import 'package:pluralsight_course_1/screens/session_screen.dart';
import 'package:pluralsight_course_1/screens/weather_screen.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }
}

List<Widget> buildMenuItems(BuildContext context) {
  final List<String> menuTitles = [
    'Home',
    'BMI Calculator',
    'Weather',
    'Training'
  ];

  List<Widget> menuItems = [];

  menuItems.add(
    const DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
      ),
      child: Text(
        'Globe Fitness',
        style: TextStyle(
          fontSize: 28.0,
          color: Colors.white,
        ),
      ),
    ),
  );

  Widget screen = Container();
  menuTitles.forEach((String element) {
    menuItems.add(
      ListTile(
        title: Text(
          element,
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
        onTap: () {
          switch (element) {
            case 'Home':
              screen = const IntroScreen();
              break;
            case 'BMI Calculator':
              screen = BmiScreen();
              break;
            case 'Weather':
              screen = const WeatherScreen();
              break;
            case 'Training':
              screen = const SessionScreen();
              break;
          }
          Navigator.pop(context);

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => screen),
            ),
          );
        },
      ),
    );
  });
  return menuItems;
}

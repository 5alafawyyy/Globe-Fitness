import 'package:flutter/material.dart';

class MenuBottomNav extends StatefulWidget {
  const MenuBottomNav({Key? key}) : super(key: key);

  @override
  State<MenuBottomNav> createState() => _MenuBottomNavState();
}

class _MenuBottomNavState extends State<MenuBottomNav> {
  int? currentIndex;
  @override
  void initState() {
    currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.monitor_weight,
          ),
          label: 'BMI',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.wind_power,
          ),
          label: 'Weather',
        ),
      ],
      currentIndex: currentIndex!,
      onTap: (int index) {
        setState(() {
          currentIndex = index;
        });
        switch (index) {
          case 0:
            Navigator.pop(context);
            Navigator.pushNamed(context, '/');
            break;
          case 1:
            Navigator.pop(context);
            Navigator.pushNamed(context, '/bmi');
            break;
          case 2:
            Navigator.pop(context);
            Navigator.pushNamed(context, '/weather');
            break;
        }
      },
    );
  }
}

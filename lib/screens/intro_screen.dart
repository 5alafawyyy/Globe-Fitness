import 'package:flutter/material.dart';
import 'package:pluralsight_course_1/shared/menu_bottom_nav.dart';
import 'package:pluralsight_course_1/shared/menu_drawer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Globe Fitness',
        ),
      ),
      drawer: const MenuDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/globe.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
              color: Colors.white70,
            ),
            child: const Text(
              'Commit tobe fit, dare to be great \nwith Globe Fitness',
              textAlign: TextAlign.center,
              style: TextStyle(
                shadows: [
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 2.0,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const MenuBottomNav(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pluralsight_course_1/data/http_helper.dart';
import 'package:pluralsight_course_1/data/weather.dart';
import 'package:pluralsight_course_1/shared/menu_bottom_nav.dart';
import 'package:pluralsight_course_1/shared/menu_drawer.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather response = Weather('name', 'description', 0, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Weather',
        ),
      ),
      drawer: const MenuDrawer(),
      body: Column(children: [
        ElevatedButton(
          onPressed: getData,
          child: const Text(
            'Get Data',
          ),
        ),
        Center(
          child: Text(response.name),
        ),
      ]),
      bottomNavigationBar: const MenuBottomNav(),
    );
  }

  void getData() async {
    HttpHelper helper = HttpHelper();
    response = await helper.getWeather('london');
    setState(() {});
  }
}

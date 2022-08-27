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
  final TextEditingController searchController = TextEditingController();
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
      body: Padding(
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(
                16.0,
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Enter a city',
                  suffixIcon: IconButton(
                    onPressed: getData,
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                ),
              ),
            ),
            weatherRow(
              'Place',
              response.name,
            ),
            weatherRow(
              'Descritption',
              response.description,
            ),
            weatherRow(
              'Temperature',
              response.temperature.toStringAsFixed(2),
            ),
            weatherRow(
              'Pressure',
              response.pressure.toString(),
            ),
            weatherRow(
              'Perceived',
              response.perceived.toStringAsFixed(2),
            ),
            weatherRow(
              'Humidity',
              response.humidity.toString(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MenuBottomNav(),
    );
  }

  void getData() async {
    HttpHelper helper = HttpHelper();
    response = await helper.getWeather(searchController.text);
    setState(() {});
  }

  Widget weatherRow(String label, String value) {
    Widget row = Padding(
      padding: const EdgeInsets.all(
        16.0,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: 20.0,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              value,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
    return row;
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pluralsight_course_1/data/weather.dart';

class HttpHelper {
// https://api.openweathermap.org/data/2.5/weather?q=cairo&appid=e7e76f54d08bf0f7fe26eb9bba83bebf

  // Domain Name (Authority):
  final String authority = 'api.openweathermap.org';

  // Path URL :
  final String path = 'data/2.5/weather';

  // API key :
  final String apiKey = 'e7e76f54d08bf0f7fe26eb9bba83bebf';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {
      'q': location,
      'appId': apiKey,
    };
    Uri uri = Uri.https(
      authority,
      path,
      parameters,
    );

    http.Response response = await http.get(uri);

    // Convert Map into a String
    Map<String, dynamic> data = jsonDecode(response.body);

    Weather weather = Weather.fromJson(data);
    return weather;
  }
}

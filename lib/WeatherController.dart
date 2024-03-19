import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/WeatherData.dart';

class WeatherController {
  static String cityName = "";
  static bool isLoading = false;
  static String apiKey = "f71660332cef0561cde271e501606d22";
  static WeatherData weatherData;

  static loadWeather() async {
    String url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey';
    final weatherResponse = await http.get(Uri.parse(url));

    if (weatherResponse.statusCode == 200) {
      weatherData = new WeatherData.fromJson(jsonDecode(weatherResponse.body));
      isLoading = false;
    }
  }

  static updateCity(value) {
    cityName = value;
  }
}

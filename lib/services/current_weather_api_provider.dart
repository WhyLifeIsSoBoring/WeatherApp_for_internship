import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app_for_internship/models/current_weather.dart';

class CurrentWeatherProvider {

  Future getCurrentWeather() async {
    CurrentWeather currentWeather;
    String lat = "53.893009";   
    String lon = "27.567444";
    String apiKey = "fa9d791964704e17c3d2943c20e2533a";
    var url = "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$apiKey&units=metric";

    final response  = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final currentWeatherJson = json.decode(response.body);
      currentWeather = CurrentWeather.fromJson(currentWeatherJson);
      return currentWeather;
    } else {
      throw Exception("Error fetching weather");
    }
  }
}
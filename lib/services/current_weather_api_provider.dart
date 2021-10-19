import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:weather_app_for_internship/models/current_weather.dart';

class CurrentWeatherProvider {

  Future getCurrentWeather(LocationData _location) async {

    CurrentWeather currentWeather;
    String lat = '${_location.latitude}';   
    String lon = '${_location.longitude}';
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
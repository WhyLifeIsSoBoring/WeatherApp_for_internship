import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:weather_app_for_internship/models/weather.dart';

class WeatherProvider {

  Future<Weather> getWeather(LocationData _location) async {

    Weather weather;
    String lat = '${_location.latitude}';   
    String lon = '${_location.longitude}';
    String apiKey = "fa9d791964704e17c3d2943c20e2533a";
    var url = "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$apiKey&units=metric";

    final response  = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      final weatherJson = json.decode(response.body);
      weather = Weather.fromJson(weatherJson);
      return weather;
    } else {
      throw Exception("Error fetching weather");
    }
  }
}
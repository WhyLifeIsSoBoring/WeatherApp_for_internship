import 'package:weather_app_for_internship/models/current_weather.dart';

abstract class WeatherState {}

class CurrentWeatherInitialState extends WeatherState{}

class CurrentWeatherLoadingState extends WeatherState {}

class CurrentWeatherLoadedState extends WeatherState {
  CurrentWeather currentWeather;
  CurrentWeatherLoadedState({required this.currentWeather});
}

class CurrentWeatherErrorState extends WeatherState {}


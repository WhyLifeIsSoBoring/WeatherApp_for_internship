import 'package:weather_app_for_internship/models/current_weather.dart';

abstract class WeatherState {
  late int currentIndex;
}
class InitialState extends WeatherState {
  final int currentIndex = 0;
}

class CurrentWeatherLoadingState extends WeatherState {
  final int currentIndex = 0;
}

class CurrentWeatherLoadedState extends WeatherState {
  final int currentIndex = 0;
  CurrentWeather currentWeather;
  CurrentWeatherLoadedState({required this.currentWeather});
}

class CurrentWeatherErrorState extends WeatherState {
  final int currentIndex = 0;
}

class ForecastWeatherLoadingState extends WeatherState {
  final int currentIndex = 1;
}

class ForecastWeatherLoadedState extends WeatherState {
  final int currentIndex = 1;

}

class ForecastWeatherErrorState extends WeatherState {
  final int currentIndex = 1;
}
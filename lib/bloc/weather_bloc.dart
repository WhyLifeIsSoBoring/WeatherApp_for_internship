import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_for_internship/bloc/weather_event.dart';
import 'package:weather_app_for_internship/bloc/weather_state.dart';
import 'package:weather_app_for_internship/models/current_weather.dart';
import 'package:weather_app_for_internship/services/current_weather_api_provider.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  CurrentWeatherProvider currentWeatherProvider;
  WeatherBloc(this.currentWeatherProvider) : super(InitialState());

  @override 
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is CurrentWeatherLoadEvent) {
      yield CurrentWeatherLoadingState();
      try {
        final CurrentWeather _currentWeather = await currentWeatherProvider.getCurrentWeather();
        yield CurrentWeatherLoadedState(currentWeather: _currentWeather);
      } catch (_) {
        yield CurrentWeatherErrorState();
      }
    } else if (event is ForecastWeatherLoadEvent) {
      yield ForecastWeatherLoadingState();
    }
  }
}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:weather_app_for_internship/bloc/weather_event.dart';
import 'package:weather_app_for_internship/bloc/weather_state.dart';
import 'package:weather_app_for_internship/models/current_weather.dart';
import 'package:weather_app_for_internship/services/current_location_provider.dart';
import 'package:weather_app_for_internship/services/current_weather_api_provider.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  CurrentWeatherProvider currentWeatherProvider;
  CurrentLocationProvider currentLocationProvider;
  WeatherBloc(this.currentWeatherProvider, this.currentLocationProvider) : super(InitialState());

  @override 
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is CurrentWeatherLoadEvent) {
      yield CurrentWeatherLoadingState();
      try {
        final LocationData _location = await currentLocationProvider.getCurrentLocation();
        final CurrentWeather _currentWeather = await currentWeatherProvider.getCurrentWeather(_location);
        yield CurrentWeatherLoadedState(currentWeather: _currentWeather);
      } catch (_) {
        yield CurrentWeatherErrorState();
      }
    } else if (event is ForecastWeatherLoadEvent) {
      yield ForecastWeatherLoadingState();
    }
  }
}
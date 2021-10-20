import 'package:flutter/material.dart';
import 'package:weather_app_for_internship/bloc/weather_state.dart';
import 'package:weather_app_for_internship/functions/icons.dart';
import 'package:weather_app_for_internship/presentation/custom_icons_icons.dart';

Widget currentWeatherView(BuildContext context, WeatherContentState state) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Container(
        padding: EdgeInsets.only(top: 30.0),
        child: Icon(
          getWeatherIcon(state.weather.currentWeather.icon),
          size: 150.0,
          color: Colors.yellow[600],
        ),
      ),
      Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
        margin: EdgeInsets.only(right: 55.0),
        child: ListTile(
          leading: Icon(
            CustomIcons.direction,
            size: 20.0,
            color: Colors.green,
          ),
          title: Text(
            '${state.weather.currentWeather.city}, ${state.weather.currentWeather.country}',
            style: TextStyle(fontSize: 25.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0, top: 10.0),
        child: Text(
          '${state.weather.currentWeather.temp}°C | ${state.weather.currentWeather.main}',
          style: TextStyle(fontSize: 30.0, color: Colors.blue),
        ),
      ),
    ],
  );
}
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:weather_app_for_internship/bloc/weather_state.dart';

Widget shareView(CurrentWeatherLoadedState state) {
  return Align(
    child: Container(
    width: 120.0,
    height: 50.0,
    margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
    child: TextButton(
      onPressed: () async { 
        await Share.share('In ${state.currentWeather.city} now ${state.currentWeather.main}. Current temperature: ${state.currentWeather.temp}°C');
       },
      child: Text(
        'Share',
        style: TextStyle(fontSize: 25.0, color: Colors.yellow[700]),
        textAlign: TextAlign.center,
      ),
    ),
    )
  );
}
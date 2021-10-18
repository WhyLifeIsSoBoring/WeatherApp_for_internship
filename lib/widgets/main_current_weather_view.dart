import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weather_app_for_internship/bloc/weather_state.dart';
import 'package:weather_app_for_internship/widgets/current_weather_view.dart';
import 'package:weather_app_for_internship/widgets/extended_current_weather_view.dart';
import 'package:weather_app_for_internship/widgets/share_view.dart';

Widget mainCurrentWeatherView(BuildContext context, WeatherState state) {
  if(state is CurrentWeatherLoadingState) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  if (state is CurrentWeatherLoadedState) {
    return ListView(
      children: <Widget>[
        currentWeatherView(context, state),
        Divider(height: 30.0, thickness: 2, indent: 100.0, endIndent: 100.0,),
        extendedCurrentWeatherView(context, state),
        Divider(height: 30.0, thickness: 2, indent: 100.0, endIndent: 100.0,),
        shareView(),
      ],
    );
  }
  if (state is CurrentWeatherErrorState) {
    return Center(
      child: Text(
        'Error fetching current weather', 
        style: TextStyle(fontSize: 30.0),
      ),
    );
  }
  return Center();
}




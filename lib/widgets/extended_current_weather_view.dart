import 'package:flutter/material.dart';
import 'package:weather_app_for_internship/bloc/weather_state.dart';
import 'package:weather_app_for_internship/functions/wind_direction.dart';
import 'package:weather_app_for_internship/presentation/custom_icons_icons.dart';

Widget extendedCurrentWeatherView(BuildContext context, CurrentWeatherLoadedState state) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Icon(
                      CustomIcons.rain,
                      size: 30.0,
                      color: Colors.yellow[600],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: Text(
                      '${state.currentWeather.pop}%',
                      style: TextStyle(fontSize: 17.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Icon(
                      CustomIcons.drop,
                      size: 30.0,
                      color: Colors.yellow[600],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: Text(
                      '${state.currentWeather.humidity}%',
                      style: TextStyle(fontSize: 17.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Icon(
                      CustomIcons.temperature,
                      size: 30.0,
                      color: Colors.yellow[600],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: Text(
                      '${state.currentWeather.pressure} hPa',
                      style: TextStyle(fontSize: 17.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 65.0),
                    child: Icon(
                      CustomIcons.wind,
                      size: 30.0,
                      color: Colors.yellow[600],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0,left: 65.0,),
                    child: Text(
                      '${state.currentWeather.windSpeed} km/h',
                      style: TextStyle(fontSize: 17.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 65.0),
                    child: Icon(
                      CustomIcons.compass,
                      size: 30.0,
                      color: Colors.yellow[600],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0, right: 65.0),
                    child: Text(
                      windDirection(state.currentWeather.windDeg),
                      style: TextStyle(fontSize: 17.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
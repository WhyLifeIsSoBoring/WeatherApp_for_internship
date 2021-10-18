import 'package:flutter/material.dart';
import 'package:weather_app_for_internship/bloc/weather_state.dart';
import 'package:weather_app_for_internship/presentation/custom_icons_icons.dart';

Widget currentWeatherView(BuildContext context, CurrentWeatherLoadedState state) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Container(
        padding: EdgeInsets.only(top: 30.0),
        child: Icon(
          CustomIcons.sun,
          size: 150.0,
          color: Colors.yellow[600],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        margin: EdgeInsets.only(right: 55.0),
        child: ListTile(
          leading: Icon(
            CustomIcons.direction,
            size: 20.0,
            color: Colors.green,
          ),
          title: Text(
            '${state.currentWeather.city}, ${state.currentWeather.country}',
            style: TextStyle(fontSize: 25.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      /*Container(
        padding: EdgeInsets.symmetric(vertical: 10.0 ,horizontal: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 50.0, right: 20.0),
              child: Icon(
                CustomIcons.direction,
                size: 20.0,
                color: Colors.green,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50.0),
              child: Text(
                '${state.currentWeather.city}, ${state.currentWeather.country}',
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),*/
      Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0, top: 10.0),
        child: Text(
          '${state.currentWeather.temp}°C | ${state.currentWeather.main}',
          style: TextStyle(fontSize: 30.0, color: Colors.blue),
        ),
      ),
    ],
  );
}
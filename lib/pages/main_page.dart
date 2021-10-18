import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_for_internship/bloc/weather_bloc.dart';
import 'package:weather_app_for_internship/bloc/weather_event.dart';
import 'package:weather_app_for_internship/bloc/weather_state.dart';
import 'package:weather_app_for_internship/presentation/custom_icons_icons.dart';
import 'package:weather_app_for_internship/services/current_weather_api_provider.dart';
import 'package:weather_app_for_internship/widgets/main_current_weather_view.dart';

class MainPage extends StatelessWidget {
  CurrentWeatherProvider currentWeatherProvider = CurrentWeatherProvider();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (context) => WeatherBloc(currentWeatherProvider)..add(CurrentWeatherLoadEvent()),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          return Scaffold(
            body: (() {
              if(state.currentIndex == 0) {
                return Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    backgroundColor: Colors.white,
                    title: Text(
                      'Today',
                      style: TextStyle(color: Colors.black),),
                  ),
                  body: mainCurrentWeatherView(context, state)
                );
              } else if (state.currentIndex == 1) {
                return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text('City'),
                ),
                body: Center(child: Text('Forecast', style: TextStyle(fontSize: 60.0)),)
              );
              }
            }()),
            bottomNavigationBar: BottomNavigationBar (
              type: BottomNavigationBarType.fixed,
              currentIndex: state.currentIndex,
              onTap: (index)  {
                if(index == 0) {
                  BlocProvider.of<WeatherBloc>(context).add(CurrentWeatherLoadEvent());
                } else if (index == 1) {
                  BlocProvider.of<WeatherBloc>(context).add(ForecastWeatherLoadEvent());
                }
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(CustomIcons.sun),
                  label: 'Today',
                  backgroundColor: Colors.blue,
                ),
                BottomNavigationBarItem(
                  icon: Icon(CustomIcons.cloud_moon),
                  label: 'Forecast',
                  backgroundColor: Colors.blue,
                ),
              ],
            ),
          );
        })
    );
  }
}
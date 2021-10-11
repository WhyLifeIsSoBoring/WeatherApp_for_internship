import 'package:flutter/material.dart';
import 'package:weather_app_for_internship/presentation/custom_icons_icons.dart';


class MainPage  extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Today'),
      ),
      body: Center(child: Text('Today', style: TextStyle(fontSize: 60.0)),)
    ),
    Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('City'),
      ),
      body: Center(child: Text('Forecast', style: TextStyle(fontSize: 60.0)),)
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar (
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
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
  }
}
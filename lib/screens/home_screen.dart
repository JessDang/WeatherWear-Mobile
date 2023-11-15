// home_screen.dart
import 'package:flutter/material.dart';
import '../widgets/weather_info.dart';
import '../widgets/category_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WeatherWear'), // text : weather wear 
      ),
      body: Column(
        children: [
          WeatherInfo(), // weather information
          Expanded(
            child: CategorySection(), // clothes part
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.thermostat_outlined), // tem
            label: 'Weather',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt), // camera
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search), // cloth
            label: 'ClosetSearch',
          ),
        ],
      ),
    );
  }
}

// home_screen.dart
import 'package:flutter/material.dart';
import '../widgets/greeting_section.dart';
import '../widgets/weather_info.dart'; 

// HomeScreen is the main screen of the app that users see upon opening the app.

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const horizontalPadding = 16.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('WeatherWear'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //crossAxisAlignment: CrossAxisAlignment.center,// geeting part will be center smaller 
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: const GreetingSection(username: 'Aaron'), // The greeting part
            ),
            const SizedBox(height: 16), // Adds some vertical spacing
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: const WeatherInfoSection(), // The weather information part
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // Bottom navigation bar items
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.thermostat_outlined),
            label: 'Weather',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'ClosetSearch',
          ),
        ],
      ),
    );
  }
}

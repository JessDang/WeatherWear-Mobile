// The home page, displaying today's outfit recommendations and weather.

// home_screen.dart
import 'package:flutter/material.dart';
import '../widgets/category_section.dart';
import '../widgets/weather_info.dart';

/// The home screen of the application.
class HomeScreen extends StatelessWidget {
  // You can add parameters to the constructor if needed
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'WeatherWear'), // App title or user greeting could go here
      ),
       body: SingleChildScrollView(
        child: Column(
          children: [
            const WeatherInfo(), // This can stay const.
            CategorySection(), // No const here if the constructor isn't const.
          ],
        ),
      ),
      // You can also add a BottomNavigationBar or FloatingActionButton if needed
    );
  }
}

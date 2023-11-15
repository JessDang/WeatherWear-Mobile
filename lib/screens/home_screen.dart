// home_screen.dart
import 'package:flutter/material.dart';
import '../widgets/weather_info.dart';
import '../widgets/category_section.dart';
import '../widgets/greeting_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WeatherWear'), // text 
        elevation: 0, // moveout AppBar shadow
        backgroundColor: Colors.transparent, // color 
      ),
       body: SafeArea( // using SafeArea, make sure the imformation will showup
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, 
          children: [
            Center( // center
              child: GreetingSection(username: 'Aaron'), // morning part
            ),
          ],
        ),
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

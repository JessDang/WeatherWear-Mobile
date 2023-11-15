import 'package:flutter/material.dart';
import '../widgets/greeting_section.dart';
import '../widgets/weather_info.dart'; 
import '../widgets/my_calendar.dart';
import '../widgets/outfit_suggestions.dart';
import '../models/outfit.dart'; 
import '../screens/closet_screen.dart';

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
        child: SingleChildScrollView( // using  SingleChildScrollView including  Column
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: const GreetingSection(username: 'Aaron'), // greeting 
              ),
              const SizedBox(height: 16), // add some space 
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: const WeatherInfoSection(), // weather 
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: MyCalendar(), // calendar 
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: OutfitSuggestions(outfits: fakeOutfits), // suggestion about outfit 
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          switch (index) {
            case 0:
              // Navigate to the Weather page
              break;
            case 1:
              // Open the Camera
              break;
            case 2:
              // Navigate to the Closet Screen
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => ClosetScreen(),
              ));
              break;
          }
        },
        items: const [
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
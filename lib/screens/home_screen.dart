import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:weatherwear/widgets/user_avatar.dart';
import '../widgets/greeting_section.dart';
import '../widgets/weather_info.dart';
import '../widgets/my_calendar.dart';
import '../widgets/outfit_suggestions.dart';
import '../models/outfit.dart';
import '../screens/closet_screen.dart';
import '../screens/camera_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    const horizontalPadding = 16.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Wear'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          // using  SingleChildScrollView including  Column
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
                child: const UserAvatar(), // suggestion avatar
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: MyCalendar(), // calendar
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: OutfitSuggestions(
                    outfits: fakeOutfits), // suggestion about outfit
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

// A widget that displays weather information such as city, temperature, and date.
class WeatherInfoSection extends StatelessWidget {
  const WeatherInfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[300], // The background color of the container
        borderRadius: BorderRadius.circular(25), // The border radius of the container
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space out the child widgets equally
        children: [
          // City and temperature information
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start of the column
            children: [
              Text(
                'Pittsburgh', // The name of the city
                style: TextStyle(
                  fontWeight: FontWeight.bold, // Makes text bold
                ),
              ),
              Text(
                '39°', // The temperature
                style: TextStyle(
                  fontSize: 24, // The font size for temperature
                  fontWeight: FontWeight.bold, // Makes temperature text bold
                ),
              ),
            ],
          ),
          // The date
          Text(
            'Nov 15', // The date
            style: TextStyle(
              fontWeight: FontWeight.bold, // Makes date text bold
            ),
          ),
          // Weather icons
          Row(
            children: [
              Icon(Icons.wb_sunny), // Morning weather icon
              SizedBox(width: 5), // Spacing between icons
              Icon(Icons.wb_sunny), // Noon weather icon
              SizedBox(width: 5), // Spacing between icons
              Icon(Icons.wb_sunny), // Afternoon weather icon
              SizedBox(width: 5), // Spacing between icons
              Icon(Icons.nightlight_round), // Evening weather icon
            ],
          ),
        ],
      ),
    );
  }
}

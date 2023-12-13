import 'package:flutter/material.dart';

class WeatherInfoSection extends StatelessWidget {
  const WeatherInfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // City and temperature information
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pittsburgh',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '39°',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // The date
              Text(
                'Nov 15',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // Weather icons with improved spacing at the bottom
          SizedBox(height: 10), // Adjusted spacing
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.wb_sunny, size: 20), // Morning weather icon
              Icon(Icons.wb_sunny, size: 20), // Noon weather icon
              Icon(Icons.wb_sunny, size: 20), // Afternoon weather icon
              Icon(Icons.nightlight_round, size: 20), 
              Icon(Icons.nightlight_round, size: 20), 
              Icon(Icons.nightlight_round, size: 20), // Evening weather icon
            ],
          ),
        ],
      ),
    );
  }
}

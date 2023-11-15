import 'package:flutter/material.dart';

/// A widget that displays weather information using fake data.
/// This is for demonstration purposes to simulate real functionality.
class WeatherInfo extends StatelessWidget {
  const WeatherInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String weatherCondition = 'Sunny';
    const int temperatureCelsius = 25;

    // Removed const from Container and Row as they contain a non-constant Text widget.
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.wb_sunny, size: 32.0), // The Icon can be const.
          SizedBox(width: 8.0), // The SizedBox can be const.
          Text(
            '$weatherCondition, $temperatureCelsius°C',
            style: TextStyle(fontSize: 24.0), // The TextStyle can be const.
          ),
        ],
      ),
    );
  }
}

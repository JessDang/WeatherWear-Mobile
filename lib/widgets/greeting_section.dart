import 'dart:math';
import 'package:flutter/material.dart';

// A widget that displays a greeting message at the top of the main page.
class GreetingSection extends StatefulWidget {
  final String username;

  // Constructor requires a username to personalize the greeting message.
  const GreetingSection({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  _GreetingSectionState createState() => _GreetingSectionState();
}

class _GreetingSectionState extends State<GreetingSection> {
  late String greetingMessage;

  String greet(String username) {
    Random rand = Random();
    int chance = rand.nextInt(100);

    if (chance == 0) {
      return "Bad morning, $username";
    } else {
      return "Good morning, $username";
    }
  }

  @override
  void initState() {
    super.initState();
    greetingMessage = greet(widget.username);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[300], // Adjust the color to match your design.
        borderRadius:
            BorderRadius.circular(20), // Adjust the corner radius size.
      ),
      child: Row(
        mainAxisSize:
            MainAxisSize.min, // Ensures the Row width only fits its children.
        children: [
          Icon(
            Icons.account_circle, // Choose an appropriate icon.
            size: 40, // Adjust the size.
          ),
          SizedBox(width: 8), // Provides spacing between the icon and the text.
          Text(
            greetingMessage, // Displays the greeting message with the username.
            style: TextStyle(
              fontSize: 18, // Adjust the font size.
              fontWeight: FontWeight.bold, // Adjust the font weight.
            ),
          ),
        ],
      ),
    );
  }
}

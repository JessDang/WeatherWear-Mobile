import 'package:flutter/material.dart';

// A widget that displays a greeting message at the top of the main page.
class GreetingSection extends StatelessWidget {
  final String username;

  // Constructor requires a username to personalize the greeting message.
  const GreetingSection({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[300], // Adjust the color to match your design.
        borderRadius: BorderRadius.circular(20), // Adjust the corner radius size.
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Ensures the Row width only fits its children.
        children: [
          Icon(
            Icons.account_circle, // Choose an appropriate icon.
            size: 40, // Adjust the size.
          ),
          SizedBox(width: 8), // Provides spacing between the icon and the text.
          Text(
            'Bad morning, $username', // Displays the greeting message with the username.
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

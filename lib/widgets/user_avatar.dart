// A widget for displaying the user's avatar. not really need ?

import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 12),
      height: 400, // Adjust the height as needed
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 185, 214, 185),
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}

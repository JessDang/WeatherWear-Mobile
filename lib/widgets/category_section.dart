// category_section.dart
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

/// A custom widget that displays a list of clothing categories.
class CategorySection extends StatelessWidget {
  // Example data: a list of categories.
  final List<String> categories = [
    'Tops',
    'Bottoms',
    'Shoes',
    'Accessories',
    // Add more categories as needed.
  ];

  // Removed the 'const' keyword from the constructor.
  CategorySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListView.builder(
        itemCount: categories.length,
        shrinkWrap: true, // Makes the ListView take up only as much space as its children.
        physics: const NeverScrollableScrollPhysics(), // Disables scrolling within the ListView.
        itemBuilder: (context, index) {
          // Build a list tile for each category.
          return ListTile(
            title: Text(categories[index]), // Display the category name.
            onTap: () {
              // Placeholder for a tap action.
              print('Tapped on ${categories[index]}');
            },
          );
        },
      ),
    );
  }
}

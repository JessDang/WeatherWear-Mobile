// File path: lib/screens/category_detail_screen.dart
import 'package:flutter/material.dart';
import '../models/clothing.dart';

class CategoryDetailScreen extends StatelessWidget {
  final String category;
  final List<Clothing> clothes;

  // Constructor with required fields for category and list of clothes
  const CategoryDetailScreen({
    Key? key,
    required this.category,
    required this.clothes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use SafeArea to avoid content being hidden by notches or bottom navigation
    return Scaffold(
      appBar: AppBar(
        title: Text(category), // Display the current category
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(8),
          // SliverGridDelegateWithFixedCrossAxisCount is used to create a fixed number of columns in the grid
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two items per row
            crossAxisSpacing: 10, // Horizontal spacing between items
            mainAxisSpacing: 10, // Vertical spacing between items
            childAspectRatio: 0.8, // Aspect ratio for the children
          ),
          itemCount: clothes.length, // Number of clothing items
          itemBuilder: (context, index) {
            final clothing = clothes[index];
            return GridTile(
              child: Image.asset(clothing.imageUrl, fit: BoxFit.cover), // Clothing image
              footer: GridTileBar(
                backgroundColor: Colors.black45,
                title: Text(
                  clothing.name,
                  style: TextStyle(fontSize: 12), // You can adjust the style as needed
                ),
                // Here you can add more information or buttons, like a favorite button
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

/// A widget representing a single piece of clothing or shoe.
class ClothingItem extends StatelessWidget {
  // Add more fields if needed, such as an identifier or a price.
  final String itemName;
  final String imageUrl;
  final String category;

  // Constructor requires item name, image URL, and category.
  const ClothingItem({
    Key? key,
    required this.itemName,
    required this.imageUrl,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use a Card widget to provide a container with shadow and rounded corners.
    return Card(
      elevation: 2.0, // Shadow size.
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Corner radius.
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Aligns children along the cross axis.
        children: <Widget>[
          Expanded(
            child: Image.network(
              imageUrl, // Display the clothing item's image.
              fit: BoxFit.cover, // Fills the space of its parent.
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              itemName, // Display the clothing item's name.
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center, // Text alignment in the center.
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              category, // Display the clothing item's category.
              style: Theme.of(context).textTheme.caption,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

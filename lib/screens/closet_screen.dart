import 'package:flutter/material.dart';
import '../models/clothing.dart';
import '../widgets/clothing_list_tile.dart';
import '../delegates/closet_search_delegate.dart';
import 'add_clothes_screen.dart';
import 'outfit_creation_screen.dart';
import 'category_detail_screen.dart'; // Ensure you have this screen for showing category details

class ClosetScreen extends StatefulWidget {
  ClosetScreen({Key? key}) : super(key: key);

  @override
  _ClosetScreenState createState() => _ClosetScreenState();
}

class _ClosetScreenState extends State<ClosetScreen> {
  int _selectedIndex = 2;

  // Navigate to AddClothesScreen to add new clothes
  void _navigateToAddClothesScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => AddClothesScreen()),
    );
  }

  // Navigate to OutfitCreationScreen to create a new outfit
  void _navigateToOutfitCreationScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => OutfitCreationScreen()),
    );
  }

  // Navigate to CategoryDetailScreen when a category is tapped
  void _navigateToCategoryDetail(String category) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CategoryDetailScreen(category: category, clothes: [],),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, List<Clothing>> categories = {
      'Outfits': [],
      'Tops': [],
      'Bottoms': [],
      'Shoes': [],
      'Accessories': [],
      // Add other categories as needed
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Closet'),
        automaticallyImplyLeading: false, // Do not show the back button
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _navigateToAddClothesScreen, // Navigate to the add clothing page
          ),
          IconButton(
            icon: const Icon(Icons.camera),
            onPressed: _navigateToOutfitCreationScreen, // Navigate to the outfit creation page
          ),
          // IconButton(
          //   icon: const Icon(Icons.search),
          //   onPressed: () {
          //     showSearch(
          //       context: context,
          //       delegate: ClosetSearchDelegate(categories.keys.cast<Clothing>().toList(), categories: []), // Pass the categories
          //     );
          //   },
          // ),
        ],
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          String category = categories.keys.elementAt(index);
          return ClothingListTile(
            category: category,
            clothes: categories[category]!,
              onTap: () {
                          _navigateToCategoryDetail(category);
                        },
  // Handle tap here
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/clothing.dart';
import '../widgets/clothing_list_tile.dart';
import '../delegates/closet_search_delegate.dart';

// import '../screens/home_screen.dart'; // Import this if you're navigating to the home screen.

class ClosetScreen extends StatefulWidget {
  ClosetScreen({Key? key}) : super(key: key);

  @override
  _ClosetScreenState createState() => _ClosetScreenState();
}

class _ClosetScreenState extends State<ClosetScreen> {
  int _selectedIndex = 2; // Set to the index corresponding to the ClosetScreen

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
      switch (index) {
        case 0:
          // When the "Weather" button is tapped, navigate back to the HomeScreen
          Navigator.popUntil(context, (route) => route.isFirst);
          break;
        case 1:
          // Handle navigation to the Camera Screen if needed
          break;
        case 2:
          // Already on the ClosetScreen, no navigation action needed
          break;
        default:
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Dummy list of Clothing items for each category
    final Map<String, List<Clothing>> categories = {
      // You need to fill in your actual data here
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
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ClosetSearchDelegate([]), // Pass your clothing data here
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          String category = categories.keys.elementAt(index);
          return ClothingListTile(
            category: category,
            clothes: categories[category]!,
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.thermostat_outlined),
            label: 'Weather',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'ClosetSearch',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

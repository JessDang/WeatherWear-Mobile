import 'package:flutter/material.dart';
import '../models/clothing.dart';
import '../widgets/clothing_list_tile.dart';
import '../delegates/closet_search_delegate.dart';
<<<<<<< Updated upstream
// import 'package:image_picker/image_picker.dart';
import 'add_clothes_screen.dart';

=======
import 'add_clothes_screen.dart';

// The main screen for the closet feature that displays categories of clothing.
>>>>>>> Stashed changes
class ClosetScreen extends StatefulWidget {
  ClosetScreen({Key? key}) : super(key: key);

  @override
  _ClosetScreenState createState() => _ClosetScreenState();
}

class _ClosetScreenState extends State<ClosetScreen> {
<<<<<<< Updated upstream
=======
  // Index to keep track of the selected bottom navigation bar item.
>>>>>>> Stashed changes
  int _selectedIndex = 2; 

  // Function to handle tapping on the bottom navigation bar items.
  void _onItemTapped(int index) {
<<<<<<< Updated upstream
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
      switch (index) {
        case 0:
          // to main 
          Navigator.popUntil(context, (route) => route.isFirst);
          break;
        case 1:
          // to camera
          break;
        case 2:
          // don't need in this page
          break;
        default:
          break;
      }
    }
  }

  void _navigateToAddClothesScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => AddClothesScreen()),
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
      // add more list 
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Closet'),
        automaticallyImplyLeading: false, // not show back
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _navigateToAddClothesScreen, // jump to add clothese screen
=======
    setState(() {
      _selectedIndex = index; // Update the selected index with the new index.
    });

    // Based on the selected index, perform navigation or other actions.
    if (index == 0) {
      // If the first item is selected, navigate back to the home screen.
      Navigator.popUntil(context, (route) => route.isFirst);
    } else if (index == 1) {
      // If the second item (Camera) is selected, navigate to the Camera screen.
      // Placeholder for navigation logic: Navigator.push(context, MaterialPageRoute(builder: (context) => CameraScreen()));
    } else if (index == 2) {
      // If the third item (ClosetSearch) is selected, no action is needed since we're already on the closet screen.
    }
  }

  // Function to add a new clothing item to a specific category.
  void addClothingToCategory(String category, Clothing clothing) {
    setState(() {
      categories[category]?.add(clothing); // Add the new clothing item to the specified category.
    });
  }

  // A map to hold lists of clothing items for each category.
  final Map<String, List<Clothing>> categories = {
    'Outfits': [],
    'Tops': [],
    'Bottoms': [],
    'Shoes': [],
    'Accessories': [],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Closet'), // App bar title.
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // When the add icon is pressed, navigate to the AddClothesScreen.
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddClothesScreen(
                    onAdd: (String category, Clothing newClothing) {
                      addClothingToCategory(category, newClothing); // Callback for when a new clothing item is added.
                    },
                  ),
                ),
              );
            },
>>>>>>> Stashed changes
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // When the search icon is pressed, show the search interface.
              showSearch(
                context: context,
<<<<<<< Updated upstream
                delegate: ClosetSearchDelegate([]), // send clothes data
=======
                delegate: ClosetSearchDelegate(categories as List<Clothing>), // Make sure the delegate is passed the correct categories.
>>>>>>> Stashed changes
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: categories.keys.length,
        itemBuilder: (context, index) {
          // For each category, create a ClothingListTile widget.
          String category = categories.keys.elementAt(index);
          return ClothingListTile(
            category: category,
            clothes: categories[category]!, // Pass the list of clothes for this category.
            onTap: () { /* Add onTap functionality if needed */ },
          );
        },
      ),
<<<<<<< Updated upstream
=======
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.thermostat_outlined),
            label: 'Weather', // Label for the weather item.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Camera', // Label for the camera item.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'ClosetSearch', // Label for the closet search item.
          ),
        ],
        currentIndex: _selectedIndex, // Set the current index to the selected index.
        onTap: _onItemTapped, // Set the onTap callback.
      ),
>>>>>>> Stashed changes
    );
  }
}

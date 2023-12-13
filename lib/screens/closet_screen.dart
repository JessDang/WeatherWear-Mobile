import 'package:flutter/material.dart';
import '../models/clothing.dart';
import '../widgets/clothing_list_tile.dart';
import '../delegates/closet_search_delegate.dart';
// import 'package:image_picker/image_picker.dart';
import 'add_clothes_screen.dart';

class ClosetScreen extends StatefulWidget {
  ClosetScreen({Key? key}) : super(key: key);

  @override
  _ClosetScreenState createState() => _ClosetScreenState();
}

class _ClosetScreenState extends State<ClosetScreen> {
  int _selectedIndex = 2; 

  void _onItemTapped(int index) {
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
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ClosetSearchDelegate([]), // send clothes data
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
    );
  }
}

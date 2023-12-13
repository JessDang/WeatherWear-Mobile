import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_clothes_screen.dart';
import 'outfit_creation_screen.dart';
import 'category_detail_screen.dart'; // Ensure you have this screen for showing category details

class ClosetScreen extends StatefulWidget {
  ClosetScreen({Key? key}) : super(key: key);

  @override
  _ClosetScreenState createState() => _ClosetScreenState();
}

class _ClosetScreenState extends State<ClosetScreen> {

  void _navigateToAddClothesScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => AddClothesScreen()),
    );
  }

  void _navigateToOutfitCreationScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => OutfitCreationScreen()),
    );
  }

  void _navigateToCategoryDetail(String category) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CategoryDetailScreen(category: category, clothes: []),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> categories = ['Outfits', 'Tops', 'Bottoms', 'Shoes', 'Accessories'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Closet',
          style: GoogleFonts.nunito(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: _navigateToAddClothesScreen,
          ),
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.black),
            onPressed: _navigateToOutfitCreationScreen,
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: categories.length,
        separatorBuilder: (context, index) => Divider(color: Colors.grey[300]),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              categories[index],
              style: GoogleFonts.nunito(fontSize: 18, color: Colors.black),
            ),
            trailing: Icon(Icons.chevron_right, color: Colors.grey),
            onTap: () {
              _navigateToCategoryDetail(categories[index]);
            },
          );
        },
      ),
    );
  }
}

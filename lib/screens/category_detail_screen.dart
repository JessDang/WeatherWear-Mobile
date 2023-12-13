// lib/screens/category_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:weatherwear/models/clothing.dart';
import 'dart:io';
import '../data/global_clothing_data.dart'; 

class CategoryDetailScreen extends StatefulWidget {
  final String category;

  const CategoryDetailScreen({Key? key, required this.category, required List<Clothing> clothes}) : super(key: key);

  @override
  _CategoryDetailScreenState createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final globalData = GlobalClothingData(); 
    final clothes = globalData.getClothesForCategory(widget.category);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(8),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemCount: clothes.length,
          itemBuilder: (context, index) {
            final clothingItem = clothes[index];
            return GridTile(
              child: Image.file(clothingItem.image, fit: BoxFit.cover),
              footer: GridTileBar(
                backgroundColor: Colors.black45,
                title: Text(
                  clothingItem.label,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}



// lib/data/global_clothing_data.dart
import 'dart:io';

// A class to hold information about a single clothing item
class ClothingItem {
  final File image;
  final String label;

  ClothingItem({required this.image, required this.label});
}

// A singleton class to manage global clothing data
class GlobalClothingData {
  // Private constructor for the singleton
  GlobalClothingData._internal();

  // The single instance of GlobalClothingData
  static final GlobalClothingData _instance = GlobalClothingData._internal();

  // Factory constructor to return the same instance
  factory GlobalClothingData() => _instance;

  // A private Map to hold lists of ClothingItem objects, categorized by clothing types
  final Map<String, List<ClothingItem>> _clothes = {
    'Outfits': [],
    'Tops': [],
    'Bottoms': [],
    'Shoes': [],
    'Accessories': [],
  };

  // Method to add a clothing item to a specific category
  void addClothes(String category, File image, String label) {
    final clothingItem = ClothingItem(image: image, label: label);
    final list = _clothes[category] ?? [];
    list.add(clothingItem);
    _clothes[category] = list;
  }

  // Method to get all clothing items for a specific category
  List<ClothingItem> getClothesForCategory(String category) {
    return _clothes[category] ?? [];
  }
}



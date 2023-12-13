// lib/data/global_clothing_data.dart
import 'dart:io';

class ClothingItem {
  final File image;
  final String label;

  ClothingItem({required this.image, required this.label});
}

class GlobalClothingData {
  static final GlobalClothingData _instance = GlobalClothingData._internal();

  factory GlobalClothingData() => _instance;

  GlobalClothingData._internal();

  final Map<String, List<ClothingItem>> _clothes = {
    'Outfits': [],
    'Tops': [],
    'Bottoms': [],
    'Shoes': [],
    'Accessories': [],
  };

  void addClothes(String category, File image, String label) {
    final clothingItem = ClothingItem(image: image, label: label);
    final list = _clothes[category] ?? [];
    list.add(clothingItem);
    _clothes[category] = list;
  }

  List<ClothingItem> getClothesForCategory(String category) {
    return _clothes[category] ?? [];
  }
}



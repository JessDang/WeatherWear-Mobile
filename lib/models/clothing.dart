// The data model for clothing items
import 'package:flutter/src/painting/image_resolution.dart';

class Clothing {
  final String id; 
  final String name; 
  final String category; 
  final String size; 
  final String color; 
  final String imageUrl; 

  Clothing({
    required this.id,
    required this.name,
    required this.category,
    required this.size,
    required this.color,
    required this.imageUrl, required String label, required AssetImage image,
  });

  get image => null;

  Null get label => null;
}

// // fake data
// final List<Clothing> fakeClothingData = [
//   Clothing(
//     id: '1',
//     name: 'green_cloth',
//     category: 'Tops',
//     size: 'M',
//     color: 'green',
//     imageUrl: 'assets/images/outfit1.jpg', 
//   ),
//   Clothing(
//     id: '2',
//     name: 'white winter',
//     category: 'Tops',
//     size: 'M',
//     color: 'white',
//     imageUrl: 'assets/images/outfit2.jpg',
//   ),
//   Clothing(
//     id: '3',
//     name: 'Jaket green',
//     category: 'Tops',
//     size: 'M',
//     color: 'light green',
//     imageUrl: 'assets/images/outfit3.jpg',
//   ),
  
// ];

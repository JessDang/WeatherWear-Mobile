// lib/screens/add_clothes_screen.dart
// ignore_for_file: library_private_types_in_public_api

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../data/global_clothing_data.dart'; 

class AddClothesScreen extends StatefulWidget {
  const AddClothesScreen({super.key});

  @override
  _AddClothesScreenState createState() => _AddClothesScreenState();
}

class _AddClothesScreenState extends State<AddClothesScreen> {
  XFile? _image;
  String? _selectedCategory;
  final TextEditingController _labelController = TextEditingController(); 
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    try {
      final XFile? selectedImage = await _picker.pickImage(source: ImageSource.gallery);
      if (selectedImage != null) {
        setState(() {
          _image = selectedImage;
        });
      }
    } catch (e) {
      print('Error selecting image: $e');
    }
  }

  void _submit() {
    if (_image != null && _selectedCategory != null && _labelController.text.isNotEmpty) {
      final globalData = GlobalClothingData();
      globalData.addClothes(_selectedCategory!, File(_image!.path), _labelController.text);
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an image, category, and enter a label first')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> categories = ['Outfits', 'Tops', 'Bottoms', 'Shoes', 'Accessories'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Clothing'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Start content layout from the top
          crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
          children: <Widget>[
            const SizedBox(height: 20), // Add some space at the top
            DropdownButton<String>(
              isExpanded: true, // Dropdown occupies full horizontal space
              hint: const Text('Select Category', textAlign: TextAlign.center), // Centered hint text
              value: _selectedCategory,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCategory = newValue;
                });
              },
              items: categories.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, textAlign: TextAlign.center), // Center text for each item
                );
              }).toList(),
            ),
            const SizedBox(height: 20), // Provide some space
            TextField(
              controller: _labelController,
              decoration: const InputDecoration(labelText: 'Enter Label'),
            ),
            const SizedBox(height: 20), // Provide some space
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Select Image'),
            ),
            if (_image != null)
              Image.file(
                File(_image!.path),
                height: 200, // Set image height
                fit: BoxFit.cover, // Fill proportionally
              ),
            const SizedBox(height: 20), // Provide some space
            ElevatedButton(
              onPressed: _submit,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

<<<<<<< Updated upstream
// lib/screens/add_clothes_screen.dart
// ignore_for_file: library_private_types_in_public_api

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../data/global_clothing_data.dart'; 

class AddClothesScreen extends StatefulWidget {
  const AddClothesScreen({super.key});
=======
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/clothing.dart';

// A screen that allows users to add new clothing items.
class AddClothesScreen extends StatefulWidget {
  final Function(String, Clothing) onAdd;

  // Constructor requiring a function to be called when a clothing item is added.
  AddClothesScreen({Key? key, required this.onAdd}) : super(key: key);
>>>>>>> Stashed changes

  @override
  _AddClothesScreenState createState() => _AddClothesScreenState();
}

class _AddClothesScreenState extends State<AddClothesScreen> {
<<<<<<< Updated upstream
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
=======
  final TextEditingController _nameController = TextEditingController();
  String? _selectedCategory; // Variable to hold the selected category.
  XFile? _image; // Variable to hold the selected image file.

  @override
  void dispose() {
    _nameController.dispose(); // Dispose the controller when the widget is disposed.
    super.dispose();
  }

  // Function to handle image picking from the gallery.
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image; // Set the selected image.
    });
  }

  // Function to add a new clothing item.
  void _addClothing() {
    if (_selectedCategory != null && _image != null) {
      // Creating a new Clothing object with the provided details.
      final clothing = Clothing(
        name: _nameController.text,
        imageUrl: _image!.path, id: '', category: '', size: '', color: '', // Use the path of the selected image.
        // Other necessary properties of the Clothing class can be added here.
      );
      widget.onAdd(_selectedCategory!, clothing); // Call the onAdd function with the new clothing item.
      Navigator.pop(context); // Close the screen after adding the item.
>>>>>>> Stashed changes
    }
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    List<String> categories = ['Outfits', 'Tops', 'Bottoms', 'Shoes', 'Accessories'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Clothing'),
=======
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Clothing'),
>>>>>>> Stashed changes
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
<<<<<<< Updated upstream
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
=======
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // TextField for entering the name of the clothing item.
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            // DropdownButton for selecting the category of the clothing item.
            DropdownButton<String>(
              hint: Text('Select Category'),
              value: _selectedCategory,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCategory = newValue; // Update the selected category.
                });
              },
              items: <String>['Outfits', 'Tops', 'Bottoms', 'Shoes', 'Accessories']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            // Display the selected image.
            _image != null ? Image.file(File(_image!.path)) : Container(),
            // Button to pick an image from the gallery.
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            // Button to add the clothing item to the selected category.
            ElevatedButton(
              onPressed: _addClothing,
              child: Text('Add to Category'),
>>>>>>> Stashed changes
            ),
          ],
        ),
      ),
    );
  }
}

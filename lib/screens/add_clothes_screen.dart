import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../data/global_clothing_data.dart';

class AddClothesScreen extends StatefulWidget {
  const AddClothesScreen({Key? key}) : super(key: key);

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
      final XFile? selectedImage =
          await _picker.pickImage(source: ImageSource.gallery);
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
    if (_image != null &&
        _selectedCategory != null &&
        _labelController.text.isNotEmpty) {
      final globalData = GlobalClothingData();
      globalData.addClothes(
          _selectedCategory!, File(_image!.path), _labelController.text);
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please select an image, category, and enter a label first')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      'Outfits',
      'Tops',
      'Bottoms',
      'Shoes',
      'Accessories'
    ];

    // button
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.white, 
      primary: Theme.of(context).colorScheme.secondary, 
      padding: EdgeInsets.symmetric(vertical: 12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30), 
      ),
      elevation: 4, 
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Clothing'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              DropdownButton<String>(
                isExpanded: true,
                hint: const Text('Select Category'),
                value: _selectedCategory,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue;
                  });
                },
                items: categories.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              TextField(
                controller: _labelController,
                decoration: const InputDecoration(labelText: 'Enter Label'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: buttonStyle,
                onPressed: _pickImage,
                child: const Text('Select Image'),
              ),
              const SizedBox(height: 20),
              if (_image != null) ...[
                Image.file(
                  File(_image!.path),
                  height: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
              ],
              ElevatedButton(
                style: buttonStyle,
                onPressed: _submit,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class OutfitCreationScreen extends StatefulWidget {
  @override
  _OutfitCreationScreenState createState() => _OutfitCreationScreenState();
}

class _OutfitCreationScreenState extends State<OutfitCreationScreen> {
  final String _topImage = 'assets/images/outfit1.jpeg'; // top file fake data
  final String _bottomImage = 'assets/images/outfit2.jpeg'; // bottom file

  void _shareOutfit() {
    final String outfitDetails = "Check out my new outfit!"; // share information
    Share.share(outfitDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share Your Outfit'),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: _shareOutfit,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(_topImage, height: 150, fit: BoxFit.cover),
            Image.asset(_bottomImage, height: 150, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: _shareOutfit,
                child: Text('Share this outfit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


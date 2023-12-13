import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class OutfitCreationScreen extends StatefulWidget {
  @override
  _OutfitCreationScreenState createState() => _OutfitCreationScreenState();
}

class _OutfitCreationScreenState extends State<OutfitCreationScreen> {
  final String _topImage = 'assets/images/boy1.jpeg'; // fake data 1
  final String _middleImage = 'assets/images/boy3.jpeg'; // fake data 2
  final String _bottomImage = 'assets/images/boy2.jpeg'; // fake data 3

  void _shareOutfit() {
    final String outfitDetails = "Check out my new outfit!"; // share outfit
    Share.share(outfitDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share Your Outfit'),
      ),
      body: ListView( // using list view
        children: [
          Image.asset(_topImage, fit: BoxFit.cover),
          Image.asset(_middleImage, fit: BoxFit.cover),
          Image.asset(_bottomImage, fit: BoxFit.cover),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _shareOutfit,
        child: Icon(Icons.share),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Container(height: 50.0),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}

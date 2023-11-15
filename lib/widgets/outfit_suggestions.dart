import 'package:flutter/material.dart';
import 'outfit_card.dart'; // This import path assumes that outfit_card.dart is in the same directory as OutfitSuggestions
import '../models/outfit.dart'; // Adjust the import path as necessary

class OutfitSuggestions extends StatelessWidget {
  final List<Outfit> outfits;

  const OutfitSuggestions({Key? key, required this.outfits}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        physics: BouncingScrollPhysics(), // 启用iOS风格的弹性滚动
        scrollDirection: Axis.horizontal,
        itemCount: outfits.length,
        itemBuilder: (context, index) {
          return OutfitCard(imageUrl: outfits[index].imageUrl);
        },
      ),
    );
  }
}



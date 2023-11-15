import 'package:flutter/material.dart';
import 'outfit_card.dart'; 
import '../models/outfit.dart'; 
class OutfitSuggestions extends StatelessWidget {
  final List<Outfit> outfits;

  const OutfitSuggestions({Key? key, required this.outfits}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, 
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: outfits.length,
        itemBuilder: (context, index) {
          return OutfitCard(imageUrl: outfits[index].imageUrl);
        },
      ),
    );
  }
}


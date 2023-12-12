import 'package:flutter/material.dart';

class TagSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 80.0),
      child: SingleChildScrollView(
        scrollDirection:
            Axis.horizontal, // Set the scroll direction to horizontal

        child: Row(
          mainAxisAlignment: MainAxisAlignment
              .start, // Aligns the buttons to the start of the row
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Add your onPressed functionality here
                  print('Top button pressed');
                },
                child: Text('Top'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Add your onPressed functionality here
                  print('Bottom button pressed');
                },
                child: Text('Bottom'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Add your onPressed functionality here
                  print('Shoe button pressed');
                },
                child: Text('Shoe'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Add your onPressed functionality here
                  print('Accessory button pressed');
                },
                child: Text('Accessory'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

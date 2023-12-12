import 'package:flutter/material.dart';

class TagSelector extends StatefulWidget {
  final Function(String) onTagSelected; // Callback for tag selection

  TagSelector({Key? key, required this.onTagSelected}) : super(key: key);

  @override
  _TagSelectorState createState() => _TagSelectorState();
}

class _TagSelectorState extends State<TagSelector> {
  String selectedTag = ''; // Current selected tag

  void _handleTagSelection(String tag) {
    setState(() {
      selectedTag = tag;
    });
    widget.onTagSelected(tag); // Notify parent widget of the selection
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 80.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _buildTagButton('Top'),
            _buildTagButton('Bottom'),
            _buildTagButton('Shoe'),
            _buildTagButton('Accessory'),
          ],
        ),
      ),
    );
  }

  Widget _buildTagButton(String tag) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () => _handleTagSelection(tag),
        style: ElevatedButton.styleFrom(
					onPrimary: Colors.white,
          primary: selectedTag == tag ? Colors.green : Colors.grey,
        ),
        child: Text(tag),
      ),
    );
  }
}


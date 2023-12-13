// File path: lib/delegates/closet_search_delegate.dart
import 'package:flutter/material.dart';
import '../models/clothing.dart'; 

// The search delegate class for searching within all clothes
class ClosetSearchDelegate extends SearchDelegate<Clothing?> {
  final List<Clothing> allClothes;

  // Constructor takes a list of all clothes
  ClosetSearchDelegate(this.allClothes);

  // Builds the results based on the current query
  @override
  Widget buildResults(BuildContext context) {
    // Filter the list of all clothes based on the query
    final results = allClothes.where((clothing) {
      return clothing.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    // Display the results in a list view
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final clothing = results[index];
        return ListTile(
          title: Text(clothing.name),
          leading: Image.asset(clothing.imageUrl), // Display the image of the clothing
          subtitle: Text('${clothing.category} - ${clothing.size}'),
          onTap: () {
            close(context, clothing); // Close the search page and return the selected clothing
          },
        );
      },
    );
  }

  // Builds the suggestions list which appears below the search bar as the user types
  @override
  Widget buildSuggestions(BuildContext context) {
    // Filter the list of all clothes for suggestions based on the query
    final suggestions = allClothes.where((clothing) {
      return clothing.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    // Display the suggestions in a list view
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final clothing = suggestions[index];
        return ListTile(
          title: Text(clothing.name),
          leading: Image.asset(clothing.imageUrl), // Display the image of the clothing
          subtitle: Text('${clothing.category} - ${clothing.size}'),
          onTap: () {
            query = clothing.name; // Set the search bar content to the selected clothing's name
            showResults(context); // Display the buildResults view
          },
        );
      },
    );
  }

  // Build actions for app bar - in this case, a clear button when there is a query
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = ''; // Clear the content of the search bar
            showSuggestions(context); // Show the suggestion list
          },
        ),
    ];
  }

  // Build leading widget - an icon button to close the search
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // The user did not select any item, return null safely
      },
    );
  }
}


// File path: lib/delegates/closet_search_delegate.dart
import 'package:flutter/material.dart';
import 'package:weatherwear/models/clothing.dart';

// A search delegate class for searching through the clothing categories
class ClosetSearchDelegate extends SearchDelegate<String?> {
  final List<String> categoryNames;

  ClosetSearchDelegate(List<Clothing> clothes, {required List categories})
      : categoryNames = clothes.map((clothing) => clothing.name).toList(),
        super();

  @override
  Widget buildSuggestions(BuildContext context) {
    // Filter the category names based on the search query
    final suggestions = query.isEmpty
        ? categoryNames
        : categoryNames.where((name) => name.toLowerCase().contains(query.toLowerCase())).toList();

    // Build a list view of the suggestions
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            // Return the selected category name
            close(context, suggestion);
          },
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Typically, the results would be displayed here, but since we're handling it in suggestions,
    // we'll call the buildSuggestions method.
    return buildSuggestions(context);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions for the AppBar. In this case, a clear button to clear the search query.
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            // Clear the search query
            query = '';
            showSuggestions(context);
          },
        ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // A leading icon on the left of the AppBar.
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        // Close the search context and return null
        close(context, null); // Here null is allowed because the delegate returns a nullable String
      },
    );
  }
}

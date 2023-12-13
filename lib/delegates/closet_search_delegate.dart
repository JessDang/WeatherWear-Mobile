// File path: lib/delegates/closet_search_delegate.dart
import 'package:flutter/material.dart';
import 'package:weatherwear/models/clothing.dart';

// A search delegate class for searching category names
class ClosetSearchDelegate extends SearchDelegate<String?> {
  final List<String> categories;

  ClosetSearchDelegate(List<Clothing> categories, {required this.categories});

  @override
  Widget buildSuggestions(BuildContext context) {
    // Filter the categories based on the search query
    final suggestions = query.isEmpty
        ? categories
        : categories.where((category) => category.toLowerCase().contains(query.toLowerCase())).toList();

    // Build a list view of the suggestions
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final category = suggestions[index];
        return ListTile(
          title: Text(category),
          onTap: () {
            // Return the selected category
            close(context, category);
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


import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<String> allItems;

  CustomSearchDelegate(this.allItems);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = allItems
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      children: results.map((result) {
        return ListTile(
          title: Text(result),
          onTap: () {
            close(context, result);
          },
        );
      }).toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = allItems
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      children: suggestions.map((suggestion) {
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      }).toList(),
    );
  }
}

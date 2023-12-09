import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final String searchText;

  const SearchPage({Key? key, required this.searchText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder widget for displaying search results
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: Center(
        child: Text(
          'Displaying search results for: $searchText',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

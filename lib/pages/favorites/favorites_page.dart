import 'package:flutter/material.dart';
import 'package:real_estate/models/property_model.dart';
import 'package:real_estate/pages/property_details/property_details.dart';

class FavoritesPage extends StatelessWidget {
  final List<Property>? favoriteProperties;

  FavoritesPage({this.favoriteProperties});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: favoriteProperties != null && favoriteProperties!.isNotEmpty
          ? ListView.builder(
              itemCount: favoriteProperties!.length,
              itemBuilder: (context, index) {
                Property property = favoriteProperties![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PropertyDetailsPage(property: property),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: Image.network(
                      property.coverPhoto ?? "",
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(property.title ?? ""),
                    subtitle: Text(property.description ?? ""),
                  ),
                );
              },
            )
          : Center(
              child: Text('No favorites yet.'),
            ),
    );
  }
}

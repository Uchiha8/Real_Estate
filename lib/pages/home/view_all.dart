// view_all_page.dart

import 'package:flutter/material.dart';
import 'package:real_estate/models/property_model.dart';
import 'package:real_estate/pages/property_details/property_details.dart';

class ViewAllPage extends StatelessWidget {
  final List<Property> properties;

  ViewAllPage({required this.properties});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View All Properties'),
        backgroundColor: const Color(0xffccd5f0),
      ),
      body: ListView.builder(
        itemCount: properties.length,
        itemBuilder: (context, index) {
          Property property = properties[index];
          return PropertyCardView(property: property);
        },
      ),
    );
  }
}

class PropertyCardView extends StatelessWidget {
  final Property property;

  PropertyCardView({required this.property});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                property.images.images ?? '',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200.0, // Adjust the height as needed
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              property.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: const Color(0xff350f9c),
              ),
            ),
            Text(
              '${property.price} ${property.currency.toString().split('.').last}',
              style: TextStyle(
                color: const Color(0xff350f9c),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: const Color(0xff350f9c),
                  onPressed: () {
                    // Implement like functionality
                    // You may update the 'property' object to reflect the liked state
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement navigation to property details page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PropertyDetailsPage(property: property),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff350f9c),
                  ),
                  child: Text(
                    'Details',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

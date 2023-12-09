import 'package:flutter/material.dart';
import 'package:real_estate/models/property_model.dart';

class PropertyDetailsPage extends StatelessWidget {
  final Property property;

  const PropertyDetailsPage({Key? key, required this.property})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(property.title ?? ''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/house.jpg',
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              property.title ?? '',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(property.description ?? ''),
            // Other property details
          ],
        ),
      ),
    );
  }
}

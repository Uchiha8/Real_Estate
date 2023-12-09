import 'package:flutter/material.dart';
import 'package:real_estate/models/property_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard({
    Key? key,
    required this.onTap,
    required this.property,
  }) : super(key: key);

  final VoidCallback onTap;
  final Property property;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: CachedNetworkImage(
                    imageUrl: property.coverPhoto ?? "",
                    fit: BoxFit.cover,
                    width: 300.0,
                    height: 150.0,
                    placeholder: (context, url) => Image.asset(
                      'https://placehold.jp/400x250.png',
                      fit: BoxFit.cover,
                      width: 300.0,
                      height: 150.0,
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      'https://placehold.jp/400x250.png',
                      fit: BoxFit.cover,
                      width: 300.0,
                      height: 450.0,
                    ),
                  ),
                ),
                Positioned(
                  right: 10.0,
                  top: 10.0,
                  child: GestureDetector(
                    onTap: () {
                      // Custom logic to toggle bookmark
                    },
                    child: Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Icon(
                        Icons.favorite_border,
                        size: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                width: 300.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        property.title ?? "",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        property.description ?? "",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.normal,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${property.rooms} rooms | ${property.baths} baths",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            "UZS ${property.price}",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

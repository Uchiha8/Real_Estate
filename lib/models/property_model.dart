import 'package:real_estate/models/enums/currency.dart';
import 'package:real_estate/models/image_model.dart';

class Property {
  final int id;
  final String title;
  final String description;
  final String? type;
  final String price;
  final String currency;
  final bool? rent;
  final String? marketValue;
  final int bedrooms;
  final int bathrooms;
  final double? area;
  final bool? status;
  final DateTime? dateListed;
  final int? address;
  final int agent;
  final CustomImage images;

  Property({
    required this.id,
    required this.title,
    required this.price,
    required this.currency,
    required this.agent,
    required this.images,
    this.description = "",
    this.type,
    this.rent,
    this.marketValue,
    this.bedrooms = 0,
    this.bathrooms = 0,
    this.area,
    this.status,
    this.dateListed,
    this.address,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      type: json['type'] as String?,
      price: json['price'] as String,
      currency: json['currency'] as String,
      rent: json['rent'] as bool?,
      marketValue:
      json['market_value']?.toString(), // Convert to String if necessary
      bedrooms: json['bedrooms'] as int? ?? 0,
      bathrooms: json['bathrooms'] as int? ?? 0,
      area: json['area'] as double?,
      status: json['status'] as bool?,
      dateListed: json['date_listed'] != null
          ? DateTime.parse(json['date_listed'] as String)
          : null,
      address: json['address'] as int?,
      agent: json['agent'] as int,
      images: CustomImage.fromJson(json['image']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'type': type,
      'price': price,
      'currency': currency,
      'rent': rent,
      'market_value': marketValue,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'area': area,
      'status': status,
      'date_listed': dateListed?.toIso8601String(),
      'address': address,
      'agent': agent,
      'images': images.toJson(),
    };
  }
}

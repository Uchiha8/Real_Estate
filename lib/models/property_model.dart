class Property {
  String? propertyID;
  String? coverPhoto;
  String? title;
  String? location;
  String? category;
  String? description;
  List<dynamic>? amenities;
  int? productScore;
  String? type;
  int? rooms;
  int? baths;
  double? price;

  Property({
    this.propertyID,
    this.coverPhoto,
    this.title,
    this.location,
    this.category,
    this.description,
    this.amenities,
    this.productScore,
    this.type,
    this.rooms,
    this.baths,
    this.price,
  });

  // Factory method to convert JSON into a PropertyModel instance
  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      propertyID: json['propertyID'] as String?,
      coverPhoto: json['coverPhoto'] as String?,
      title: json['title'] as String?,
      location: json['location'] as String?,
      category: json['category'] as String?,
      description: json['description'] as String?,
      amenities: json['amenities'] as List<dynamic>?,
      productScore: json['productScore'] as int?,
      type: json['type'] as String?,
      rooms: json['rooms'] as int?,
      baths: json['baths'] as int?,
      price: json['price'] as double?,
    );
  }

  // Convert PropertyModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'propertyID': propertyID,
      'coverPhoto': coverPhoto,
      'title': title,
      'location': location,
      'category': category,
      'amenities': amenities,
      'description': description,
      'productScore': productScore,
      'type': type,
      'rooms': rooms,
      'baths': baths,
      'price': price,
    };
  }
}

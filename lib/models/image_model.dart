class CustomImage {
  final int id;
  final String images;

  CustomImage({required this.id, required this.images});

  factory CustomImage.fromJson(Map<String, dynamic> json) {
    return CustomImage(
      id: json['id'] as int,
      images: json['image'] ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': images,
    };
  }
}

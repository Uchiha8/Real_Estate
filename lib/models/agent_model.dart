import 'package:real_estate/models/user_model.dart';
import 'package:real_estate/models/contact_model.dart';

class Agent {
  final int id;
  final User user;
  final Contact contact;
  final String license;
  final double? rating;

  Agent({
    required this.id,
    required this.user,
    required this.contact,
    required this.license,
    this.rating,
  });

  factory Agent.fromJson(Map<String, dynamic> json) {
    return Agent(
      id: json['id'],
      user: User.fromJson(json['user']),
      contact: Contact.fromJson(json['contact']),
      license: json['license'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user.toJson(),
      'contact': contact.toJson(),
      'license': license,
      'rating': rating,
    };
  }
}

import 'package:intl/intl.dart';

class CustomUser {
  final int id;
  final String password;
  final DateTime? lastLogin;
  final String role;
  final String email;
  final String firstName;
  final String lastName;
  final bool isActive;
  final String? profileImage;

  CustomUser({
    required this.id,
    required this.password,
    this.lastLogin,
    required this.role,
    required this.email,
    this.firstName = '',
    this.lastName = '',
    this.isActive = false,
    this.profileImage,
  });

  factory CustomUser.fromJson(Map<String, dynamic> json) {
    return CustomUser(
      id: json['id'],
      password: json['password'],
      role: json['role'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      isActive: json['is_active'],
      profileImage: json['profile_image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'password': password,
      'last_login': lastLogin?.toIso8601String(),
      'role': role,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'is_active': isActive,
      'profile_image': profileImage,
    };
  }
}

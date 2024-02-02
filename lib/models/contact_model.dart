class Contact {
  final int id;
  final String? name;
  final String? email;
  final String phone;
  final String? notes;

  Contact({
    required this.id,
    this.name,
    this.email,
    required this.phone,
    this.notes,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'notes': notes,
    };
  }
}

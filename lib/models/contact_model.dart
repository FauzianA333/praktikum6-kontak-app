class ContactModel {
  final String name;
  final String phone;
  final String email;
  final String category;
  final DateTime addedAt;

  const ContactModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.category,
    required this.addedAt,
  });

  String get initial => name.isNotEmpty ? name[0].toUpperCase() : '?';
}
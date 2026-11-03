import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/contact_model.dart';

/// Satu baris kontak, dipakai di halaman Kontak dan halaman Cari.
class ContactTile extends StatelessWidget {
  final ContactModel contact;

  const ContactTile({super.key, required this.contact});

  // Contoh hasil: "05 September 2026"
  static final DateFormat _dateFormat = DateFormat('dd MMMM yyyy', 'id_ID');

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        isThreeLine: true,
        leading: CircleAvatar(child: Text(contact.initial)),
        title: Text(
          contact.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(contact.phone),
            Text(contact.email),
            const SizedBox(height: 2),
            Text(
              'Ditambahkan pada ${_dateFormat.format(contact.addedAt)}',
              style: textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
            ),
          ],
        ),
        trailing: Chip(
          label: Text(contact.category),
          visualDensity: VisualDensity.compact,
        ),
      ),
    );
  }
}
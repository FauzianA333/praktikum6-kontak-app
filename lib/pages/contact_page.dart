import 'package:flutter/material.dart';

import '../models/contact_model.dart';
import '../widgets/contact_tile.dart';

class ContactPage extends StatelessWidget {
  final List<ContactModel> contacts;

  const ContactPage({super.key, required this.contacts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kontak (${contacts.length})')),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: contacts.length,
        itemBuilder: (context, index) => ContactTile(contact: contacts[index]),
      ),
    );
  }
}
import 'package:faker/faker.dart';

import '../models/contact_model.dart';

/// Daftar kategori offline untuk DropdownSearch.
const List<String> kategoriKontak = ['Keluarga', 'Teman', 'Kerja'];

/// Membuat [count] kontak dummy memakai package Faker.
List<ContactModel> generateDummyContacts({int count = 20}) {
  final faker = Faker();
  final now = DateTime.now();

  final contacts = List.generate(count, (_) {
    // Nomor telepon format Indonesia: 08 + 9 digit acak.
    final tail = faker.randomGenerator.integer(999999999, min: 100000000);

    return ContactModel(
      name: faker.person.name(),
      phone: '08$tail',
      email: faker.internet.email(),
      category: faker.randomGenerator.element(kategoriKontak),
      // Tanggal acak dalam 1 tahun terakhir.
      addedAt: now.subtract(
        Duration(days: faker.randomGenerator.integer(365, min: 1)),
      ),
    );
  });

  contacts.sort((a, b) => a.name.compareTo(b.name));
  return contacts;
}
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../data/contact_data.dart';
import '../models/contact_model.dart';
import 'contact_page.dart';
import 'profile_page.dart';
import 'search_page.dart';

/// Kerangka aplikasi: menyimpan data kontak dan mengatur navigasi menu.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // Dibuat sekali saja agar data Faker tidak berubah saat pindah menu.
  late final List<ContactModel> _contacts = generateDummyContacts(count: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack menjaga state tiap halaman saat berpindah tab.
      body: IndexedStack(
        index: _currentIndex,
        children: [
          ContactPage(contacts: _contacts),
          SearchPage(contacts: _contacts),
          const ProfilePage(),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.reactCircle,
        initialActiveIndex: _currentIndex,
        items: [
          TabItem(icon: Icons.contacts, title: 'Kontak'),
          TabItem(icon: Icons.search, title: 'Cari'),
          TabItem(icon: Icons.person, title: 'Profil'),
        ],
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
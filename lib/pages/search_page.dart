import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../data/contact_data.dart';
import '../models/contact_model.dart';
import '../widgets/contact_tile.dart';

class SearchPage extends StatefulWidget {
  final List<ContactModel> contacts;

  const SearchPage({super.key, required this.contacts});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? _selectedCategory;

  List<ContactModel> get _filtered => widget.contacts
      .where((c) => c.category == _selectedCategory)
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cari Kontak')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: DropdownSearch<String>(
              // Daftar offline (tanpa request internet).
              items: (filter, infiniteScrollProps) => kategoriKontak,
              selectedItem: _selectedCategory,
              popupProps: PopupProps.menu(
                showSearchBox: true,
                fit: FlexFit.loose,
                searchFieldProps: const TextFieldProps(
                  decoration: InputDecoration(
                    hintText: 'Ketik kategori...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              decoratorProps: const DropDownDecoratorProps(
                decoration: InputDecoration(
                  labelText: 'Kategori Kontak',
                  hintText: 'Pilih kategori',
                  border: OutlineInputBorder(),
                ),
              ),
              onChanged: (value) => setState(() => _selectedCategory = value),
            ),
          ),
          Expanded(child: _buildResult()),
        ],
      ),
    );
  }

  Widget _buildResult() {
    if (_selectedCategory == null) {
      return const Center(
        child: Text('Pilih kategori untuk menampilkan kontak.'),
      );
    }

    final results = _filtered;
    if (results.isEmpty) {
      return Center(
        child: Text('Tidak ada kontak di kategori $_selectedCategory.'),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Text(
            '${results.length} kontak di kategori $_selectedCategory',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) =>
                ContactTile(contact: results[index]),
          ),
        ),
      ],
    );
  }
}
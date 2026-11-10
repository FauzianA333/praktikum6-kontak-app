import 'package:flutter/material.dart';

/// Kumpulan tombol counter.
/// Aksi tidak dijalankan di sini, melainkan lewat 3 callback dari parent.
class CounterButtons extends StatelessWidget {
  final VoidCallback onAdd;
  final VoidCallback onSubtract;
  final VoidCallback onReset;

  const CounterButtons({
    super.key,
    required this.onAdd,
    required this.onSubtract,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: onSubtract,
          icon: const Icon(Icons.remove),
          label: const Text('Kurang'),
        ),
        const SizedBox(width: 12),
        OutlinedButton.icon(
          onPressed: onReset,
          icon: const Icon(Icons.refresh),
          label: const Text('Reset'),
        ),
        const SizedBox(width: 12),
        ElevatedButton.icon(
          onPressed: onAdd,
          icon: const Icon(Icons.add),
          label: const Text('Tambah'),
        ),
      ],
    );
  }
}
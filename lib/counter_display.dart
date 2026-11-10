import 'package:flutter/material.dart';

/// Menampilkan angka counter.
/// Nilai diterima dari parent lewat constructor (passing data).
class CounterDisplay extends StatelessWidget {
  final int value;

  const CounterDisplay({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Nilai Counter', style: TextStyle(fontSize: 18)),
        const SizedBox(height: 8),
        Text(
          '$value',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ],
    );
  }
}
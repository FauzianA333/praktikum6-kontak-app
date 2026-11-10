import 'package:flutter/material.dart';

import 'counter_buttons.dart';
import 'counter_display.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Counter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    debugPrint('Counter dimulai');
  }

  @override
  void dispose() {
    debugPrint('Counter ditutup');
    super.dispose();
  }

  void _tambah() {
    setState(() {
      _counter++;
    });
  }

  void _kurang() {
    // Angka tidak boleh minus: jika sudah 0, tidak melakukan apa-apa.
    if (_counter == 0) return;
    setState(() {
      _counter--;
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Counter'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Passing data: nilai counter dikirim ke child lewat constructor.
            CounterDisplay(value: _counter),
            const SizedBox(height: 32),
            // Callback: parent mengirim fungsi yang dipanggil oleh child.
            CounterButtons(
              onAdd: _tambah,
              onSubtract: _kurang,
              onReset: _reset,
            ),
          ],
        ),
      ),
    );
  }
}
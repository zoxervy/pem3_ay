import 'package:flutter/material.dart';

class Pertemuan02 extends StatefulWidget {
  const Pertemuan02({super.key});

  @override
  State<Pertemuan02> createState() => _Pertemuan02State();
}

class _Pertemuan02State extends State<Pertemuan02> {
  int _counter = 0;

  void _tambahCounter() {
    setState(() {
      _counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _kurangCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Praktikum Flutter Yusuf'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('Silakan ditekan!'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'Reset',
            onPressed: _resetCounter,
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(width: 12),
          FloatingActionButton(
            heroTag: 'Tambah',
            onPressed: _tambahCounter,
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 12),
          FloatingActionButton(
            heroTag: 'Kurang',
            onPressed: _kurangCounter,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

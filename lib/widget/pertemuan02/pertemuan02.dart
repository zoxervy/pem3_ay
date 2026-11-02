import 'package:flutter/material.dart';

class LinearLayout extends StatelessWidget {
  const LinearLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buatan Yusuf dengan AI Agentic'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'LINEAR LAYOUT',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Mengikuti orientasi: vertikal (Column) atau horizontal (Row).',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 16),

          // 1. COLUMN - SUSUNAN VERTIKAL
          const Text(
            '1. Column — Susunan Vertikal',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildColorBox('A', Colors.red),
                  const SizedBox(height: 8),
                  _buildColorBox('B', Colors.green),
                  const SizedBox(height: 8),
                  _buildColorBox('C', Colors.orange),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8, bottom: 24),
            child: Text(
              '⬆ Otomatis tersusun atas → bawah. Tidak bisa diubah arahnya.',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),

          // 2. ROW - SUSUNAN HORIZONTAL
          const Text(
            '2. Row — Susunan Horizontal',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green.shade200),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildColorBox('A', Colors.red),
                const SizedBox(width: 8),
                _buildColorBox('B', Colors.purple),
                const SizedBox(width: 8),
                _buildColorBox('C', Colors.teal),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8, bottom: 24),
            child: Text(
              '➡ Otomatis tersusun kiri → kanan.',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  // Widget bantuan untuk membuat kotak warna
  Widget _buildColorBox(String letter, Color color) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          letter,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

typedef Pertemuan02 = LinearLayout;

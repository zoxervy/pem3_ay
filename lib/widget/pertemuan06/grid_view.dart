import 'package:flutter/material.dart';

class GridViewLatihan extends StatelessWidget {
  const GridViewLatihan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materi Grid View'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      // GridView.count sangat cocok untuk membuat grid sederhana
      body: GridView.count(
        crossAxisCount: 2, // Jumlah kotak menyamping (2 kolom)
        padding: const EdgeInsets.all(16.0),
        crossAxisSpacing: 16.0, // Jarak antar kotak secara horizontal
        mainAxisSpacing: 16.0,  // Jarak antar kotak secara vertikal
        children: [
          _buildGridItem('Satu', Icons.home, Colors.red),
          _buildGridItem('Dua', Icons.star, Colors.green),
          _buildGridItem('Tiga', Icons.camera, Colors.orange),
          _buildGridItem('Empat', Icons.person, Colors.purple),
          _buildGridItem('Lima', Icons.wifi, Colors.teal),
          _buildGridItem('Enam', Icons.settings, Colors.blue),
          _buildGridItem('Tujuh', Icons.map, Colors.brown),
          _buildGridItem('Delapan', Icons.phone, Colors.pink),
        ],
      ),
    );
  }

  // Widget custom untuk membuat kotak grid beserta ikon dan teks
  Widget _buildGridItem(String title, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        // borderRadius: BorderRadius.circular(16),
        // boxShadow: const [
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 4,
        //     offset: Offset(2, 2),
        //   ),
        // ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: Colors.white),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
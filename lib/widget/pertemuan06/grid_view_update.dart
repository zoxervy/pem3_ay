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
          _buildGridImageAsset('Gambar 1', 'assets/images/test1.jpg'),
          _buildGridImageAsset('Gambar 2', 'assets/images/test2.jpg'),
          _buildGridImageUrl('Gambar 3 menggunakan url', 'https://picsum.photos/200'),
        ],
      ),
    );
  }

  // Widget custom untuk membuat kotak grid beserta ikon dan teks
  Widget _buildGridItem(String title, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
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

  Widget _buildGridImageAsset(String title, String imagePath) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), 
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey.shade200,
                  child: const Center(
                    child: Icon(Icons.broken_image, size: 36, color: Colors.grey),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridImageUrl(String title, String imageUrl) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), 
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey.shade200,
                  child: const Center(
                    child: Icon(Icons.wifi_off, size: 36, color: Colors.grey),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

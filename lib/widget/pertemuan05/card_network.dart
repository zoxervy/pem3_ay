import 'package:flutter/material.dart';

class CardNetwork extends StatelessWidget {
  const CardNetwork({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card dengan Gambar'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ListView(
          scrollDirection: Axis.vertical,
          // mainAxisSize: MainAxisSize.min,
          children: [
            // Gambar dari Asset
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.asset(
                'assets/images/test1.jpg',
                height: 350,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 250,
                  color: Colors.grey.shade200,
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image, size: 48, color: Colors.grey),
                        SizedBox(height: 8),
                        Text('Gambar Assets (test1.jpg)'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Ini adalah contoh Card dengan gambar dari Assets.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 16),

            // Gambar dari URL
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
              child: Image.network(
                'https://picsum.photos/400/200',
                height: 350,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 250,
                  color: Colors.grey.shade200,
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.wifi_off, size: 48, color: Colors.grey),
                        SizedBox(height: 8),
                        Text('Gagal memuat gambar dari URL'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Ini adalah contoh Card dengan gambar dari URL.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

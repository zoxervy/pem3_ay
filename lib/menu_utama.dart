import 'package:flutter/material.dart';
import 'package:pem3_ay/widget/pertemuan01/pertemuan01.dart';
import 'package:pem3_ay/widget/pertemuan02/pertemuan02.dart';
import 'package:pem3_ay/widget/pertemuan03/pertemuan03.dart';
import 'package:pem3_ay/widget/pertemuan04/pertemuan04.dart';

class HalamanMenuUtama extends StatelessWidget {
  const HalamanMenuUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Utama'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            const Center(child: Icon(Icons.home, size: 80, color: Colors.blue)),
            const Center(
              child: Text(
                'Selamat Datang\nPada Menu Utama Aplikasi\nNIM: 25010110186\nNama: Ahmad Yusuf',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 15),
            // Pertemuan 01
            ElevatedButton.icon(
              icon: const Icon(Icons.home),
              label: const Text('Pertemuan 01'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.yellow,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Pertemuan01()),
                );
              },
            ),
            const SizedBox(height: 15),
            // Pertemuan 02
            ElevatedButton.icon(
              icon: const Icon(Icons.home),
              label: const Text('Pertemuan 02'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.yellow,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Pertemuan02()),
                );
              },
            ),
            const SizedBox(height: 15),
            // Pertemuan 03
            ElevatedButton.icon(
              icon: const Icon(Icons.home),
              label: const Text('Pertemuan 03'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.yellow,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Pertemuan03()),
                );
              },
            ),
            const SizedBox(height: 15),
            // Pertemuan 04
            ElevatedButton.icon(
              icon: const Icon(Icons.home),
              label: const Text('Pertemuan 04'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.yellow,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Pertemuan04()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pem3_ay/widget/pertemuan05/card_network.dart';
import 'package:pem3_ay/widget/pertemuan05/listview_horizontal.dart';

class Pertemuan05 extends StatelessWidget {
  const Pertemuan05({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 05 - List & Card'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.view_column, color: Colors.blue, size: 36),
              title: const Text('List View Horizontal', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Belajar ListView dengan scroll horizontal'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ListViewHorizontal()),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Card(
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.image, color: Colors.purple, size: 36),
              title: const Text('Card dengan Gambar', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Belajar Card dengan gambar dari URL & Assets'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CardNetwork()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

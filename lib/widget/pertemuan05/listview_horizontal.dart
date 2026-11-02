import 'package:flutter/material.dart';

class ListViewHorizontal extends StatelessWidget {
  const ListViewHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List View Horizontal'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      // Membatasi tinggi ListView agar tidak memenuhi seluruh layar
      body: SizedBox(
        height: 200, 
        child: ListView(
          // Kunci utama untuk membuat scroll ke samping
          scrollDirection: Axis.horizontal, 
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildHorizontalCard('Item 1', Colors.red),
            _buildHorizontalCard('Item 2', Colors.green),
            _buildHorizontalCard('Item 3', Colors.orange),
            _buildHorizontalCard('Item 4', Colors.purple),
            _buildHorizontalCard('Item 5', Colors.teal),
            _buildHorizontalCard('Item 6', Colors.blue),
            _buildHorizontalCard('Item 7', Colors.brown),
            _buildHorizontalCard('Item 8', Colors.pink),
            _buildHorizontalCard('Item 9', Colors.indigo),
            _buildHorizontalCard('Item 10', Colors.cyan),
            _buildHorizontalCard('Item 11', Colors.lime),
            _buildHorizontalCard('Item 12', Colors.amber),
            _buildHorizontalCard('Item 13', Colors.deepOrange),
            _buildHorizontalCard('Item 14', Colors.deepPurple),
            _buildHorizontalCard('Item 15', Colors.lightBlue),
          ],
        ),
      ),
    );
  }

  // Widget custom untuk membuat kotak
  Widget _buildHorizontalCard(String text, Color color) {
    return Container(
      width: 150, // Lebar setiap kotak
      margin: const EdgeInsets.only(right: 16.0), // Jarak antar kotak
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

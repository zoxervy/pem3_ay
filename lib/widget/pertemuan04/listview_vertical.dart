import 'package:flutter/material.dart';

class ListviewVertical extends StatelessWidget {
  const ListviewVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List View Vertical'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildVerticalCard('Item 1', Colors.red),
          _buildVerticalCard('Item 2', Colors.green),
          _buildVerticalCard('Item 3', Colors.orange),
          _buildVerticalCard('Item 4', Colors.purple),
          _buildVerticalCard('Item 5', Colors.teal),
          _buildVerticalCard('Item 6', Colors.blue),
          _buildVerticalCard('Item 7', Colors.brown),
          _buildVerticalCard('Item 8', Colors.pink),
          _buildVerticalCard('Item 9', Colors.indigo),
          _buildVerticalCard('Item 10', Colors.cyan),
        ],
      ),
    );
  }

  // Widget custom untuk membuat kotak
  Widget _buildVerticalCard(String text, Color color) {
    return Container(
      height: 100, // Tinggi setiap kotak
      margin: const EdgeInsets.only(bottom: 16.0), // Jarak antar kotak
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        // boxShadow: const [
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 10,
        //     offset: Offset(2, 2),
        //   ),
        // ],
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
  
}
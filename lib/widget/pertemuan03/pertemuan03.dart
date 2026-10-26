import 'package:flutter/material.dart';


Widget kotak(String huruf, Color warna) {
  return Container(
    width: 60,
    height: 60,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: warna,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      huruf,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

class Pertemuan03 extends StatelessWidget {
  const Pertemuan03({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Linear dan Relative Layout')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // ========================================================
          // BAGIAN 1: LINEAR LAYOUT
          // Menyusun child dalam SATU ARAH: vertikal atau horizontal.
          // ========================================================
          const Text(
            'LINEAR LAYOUT',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ), // Text
          const SizedBox(height: 16),

          // ----------- 1.1 Column -----------
          const Text(
            '1. Column: susunan vertikal',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ), // Text
          const SizedBox(height: 8),

          // Align dipakai supaya kotak pembungkus menempel di kiri
          // dan hanya selebar isinya (bukan selebar layar).
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.lightBlue.shade50,
                border: Border.all(color: Colors.lightBlue),
                borderRadius: BorderRadius.circular(8),
              ), // BoxDecoration
              child: Column(
                children: [
                  kotak('A', Colors.red),
                  const SizedBox(height: 8),
                  kotak('B', Colors.green),
                  const SizedBox(height: 8),
                  kotak('C', Colors.blue),
                  const SizedBox(height: 8),
                  kotak('D', Colors.amber),
                ],
              ),
            ),
          ),
          // ----------- 1.2 Row -----------
          const Text(
            '2. Row: susunan horizontal',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ), // Text
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(10),
              ), // BoxDecoration
              // COBA UBAH #2: ganti Row menjadi Column.
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  kotak('A', Colors.red),
                  const SizedBox(height: 8),
                  kotak('B', Colors.green),
                  const SizedBox(height: 8),
                  kotak('C', Colors.blue),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Sumbu utamanya Horizontal: tersusun dari kiri ke kanan.',
            style: TextStyle(color: Colors.blueGrey),
          ),
          const SizedBox(height: 20),

          // row 1.3
          const Text(
            '3. Row dengan mainAxisAligment',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.grey.shade200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                kotak('A', Colors.red),
                kotak('B', Colors.green),
                kotak('C', Colors.orange),
              ],
            ),
          ),
          const SizedBox(height: 36),

          const Text(
            'RELATIVE LAYOUT',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          const Text(
            'Bebas tanpa aturan orientasi, sesuai perintah programmer.',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),

          const Text(
            '1. Stacking (tumpukan): Container menindih Container.',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          // stack + positioned
          const SizedBox(height: 8),
          Container(
            height: 220,
            decoration: BoxDecoration(
              color: Colors.purple.shade50,
              border: Border.all(color: Colors.purple.shade200),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Positioned(left: 200, top: 60, child: kotak('A', Colors.red)),
                Positioned(left: 90, top: 120, child: kotak('B', Colors.green)),
                Positioned(
                  left: 130,
                  top: 30,
                  child: kotak('C', Colors.orange),
                ),
                Positioned(left: 50, top: 50, child: kotak('D', Colors.blue)),
              ],
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Positioned mengatur jarak dari tepi: left, right, top, bottom',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 20),

          // 2.2 stack + allign
          const Text(
            '2. Stack dan Alig: perataan di lima posisi',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            height: 200,
            color: Colors.purple.shade50,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: kotak('1', Colors.red),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: kotak('2', Colors.green),
                ),
                Align(
                  alignment: Alignment.center,
                  child: kotak('3', Colors.orange),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: kotak('4', Colors.blue),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: kotak('5', Colors.purple),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Align meratakan widget ke posisi yang disebutkan.',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 20),

          // 2.3 urutan tumpukan
          const Text(
            '3. Urutan Tumpukan',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.purple.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Positioned(left: 20, top: 30, child: kotak('C', Colors.red)),
                Positioned(left: 55, top: 40, child: kotak('B', Colors.green)),
                Positioned(left: 90, top: 60, child: kotak('A', Colors.orange)),
              ],
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Urutan widget yang ditulis terakhir akan berada paling atas.',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 28),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.amber.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'Linear Layout (Coloumn dan ROW): satu arah, tersusun berurutan \n'
              'Relative Layout (Stack): bebas, bisa tumpuk-tumpukan',
              style: TextStyle(fontSize: 15),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

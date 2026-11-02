import 'package:flutter/material.dart';

class DataTableLatihan extends StatelessWidget {
  const DataTableLatihan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materi Data Table'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      // Membungkus dengan ListView dan SingleChildScrollView agar tabel
      // bisa di-scroll ke bawah dan ke samping jika datanya panjang/lebar
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Daftar Mahasiswa',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          // SingleChildScrollView horizontal mencegah error overflow ke kanan
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Card(
              elevation: 4,
              child: DataTable(
                // Mengatur jarak antar kolom
                columnSpacing: 30.0,
                // Judul-judul kolom (Bagian atas tabel)
                columns: const [
                  DataColumn(
                    label: Text(
                      'No',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'NIM',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Nama',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Prodi',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                // Isi baris data (Isi tabel)
                rows: const [
                  DataRow(
                    cells: [
                      DataCell(Text('1')),
                      DataCell(Text('25010110186')),
                      DataCell(Text('Ahmad Yusuf')),
                      DataCell(Text('Ilmu Komputer')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('2')),
                      DataCell(Text('25010110888')),
                      DataCell(Text('Imut Rizman')),
                      DataCell(Text('Sistem Informasi')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('3')),
                      DataCell(Text('25010110999')),
                      DataCell(Text('Mas Ironi')),
                      DataCell(Text('Teknik Kecup')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('4')),
                      DataCell(Text('25010110000')),
                      DataCell(Text('Ambatron')),
                      DataCell(Text('Teknik Suki Liar')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

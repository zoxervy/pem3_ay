import 'package:flutter/material.dart';

class DataDiriView extends StatelessWidget {
  const DataDiriView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Diri'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 55,
              backgroundColor: Colors.blueGrey,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Tempat foto nanti',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
            Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Nama'),
                subtitle: Text('Ahmad Yusuf'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.badge),
                title: Text('NIM'),
                subtitle: Text('25010110186'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.work),
                title: Text('Pekerjaan'),
                subtitle: Text('Mahasiswa'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.email),
                title: Text('Email'),
                subtitle: Text('ahmadyusuf@gmail.com'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.school),
                title: Text('Program Studi'),
                subtitle: Text('Ilmu Komputer'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.calendar_month),
                title: Text('Semester'),
                subtitle: Text('Semester 3'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.account_balance),
                title: Text('Perguruan Tinggi'),
                subtitle: Text('Universitas Bumigora'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
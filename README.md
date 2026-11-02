# Dokumentasi Praktikum Pemrograman 3 (Flutter) - Versi Pak Made Yadi

Repositori ini berisi kumpulan modul praktikum mata kuliah **Pemrograman 3 (Mobile)** berbasis Flutter untuk **Versi Pak Made Yadi**, yang telah diintegrasikan ke dalam satu aplikasi terpadu dengan dashboard navigasi menu utama.

---

## 👤 Identitas Mahasiswa

- **Nama**: Ahmad Yusuf
- **NIM**: 25010110186
- **Program Studi**: S1 Ilmu Komputer
- **Semester**: 3
- **Kampus**: Universitas Bumigora
- **Dosen Pengampu**: Pak Made Yadi

---

## 📝 Ringkasan Praktikum (Pertemuan 01 - 07)

### 📌 Pertemuan 01: UI Biodata Diri (StatelessWidget)
* **Fokus**: Pengenalan dasar Flutter dan pembuatan antarmuka profil statis (*Stateless*).
* **Komponen & Berkas**: `lib/widget/pertemuan01/view/data_diri.dart`
* **Fitur**:
  * Menampilkan foto profil menggunakan widget `CircleAvatar`.
  * Menampilkan identitas mahasiswa (Nama, NIM, Pekerjaan, Email, Prodi, Semester, Perguruan Tinggi) menggunakan kombinasi widget `Card`, `ListTile`, dan `Icon`.

---

### 📌 Pertemuan 02: Linear Layout (Column & Row)
* **Fokus**: Memahami dasar susunan tata letak linier searah di Flutter.
* **Komponen & Berkas**: `lib/widget/pertemuan02/pertemuan02.dart`
* **Fitur**:
  * **Column (Vertikal)**: Menyusun elemen secara vertikal (atas ke bawah) menggunakan serangkaian kotak warna beridentitas teks (A, B, C).
  * **Row (Horizontal)**: Menyusun elemen secara menyamping (kiri ke kanan) serta pengaturan perataan dan dekorasi container.

---

### 📌 Pertemuan 03: Layouting (Linear & Relative Layout)
* **Fokus**: Eksplorasi mendalam tata letak linier dan tata letak tumpukan relatif.
* **Komponen & Berkas**: `lib/widget/pertemuan03/pertemuan03.dart`
* **Fitur**:
  * Membuat widget bantu `kotak` dengan warna dan teks custom.
  * **Linear Layout**: Demonstrasi `Column` dan `Row` dengan variasi perataan `MainAxisAlignment.spaceEvenly`.
  * **Relative Layout**: Penggunaan `Stack` untuk menumpuk widget secara berlapis, dipadukan dengan `Positioned` (koordinat absolut) dan `Align` untuk penempatan di berbagai sudut layar.

---

### 📌 Pertemuan 04: List View Vertical
* **Fokus**: Implementasi daftar bergulir vertikal untuk menampilkan banyak data secara efisien.
* **Komponen & Berkas**: `lib/widget/pertemuan04/listview_vertical.dart`
* **Fitur**:
  * Menggunakan widget `ListView` vertikal yang dapat di-scroll lancar.
  * Setiap item dirancang dalam bentuk kartu berwarna dengan `BorderRadius` melengkung dan teks bernomor item (`Item 1` s/d `Item 10`).

---

### 📌 Pertemuan 05: List View Horizontal & Card dengan Gambar
* **Fokus**: Implementasi daftar bergulir ke samping (*horizontal scroll*) serta manipulasi komponen `Card` bergambar.
* **Komponen & Berkas**:
  * `lib/widget/pertemuan05/listview_horizontal.dart` (List View Horizontal)
  * `lib/widget/pertemuan05/card_network.dart` (Card Gambar URL & Assets)
* **Fitur**:
  * **ListView Horizontal**: Menampilkan deretan 15 kotak warna menyamping menggunakan properti `scrollDirection: Axis.horizontal`.
  * **Card dengan Gambar**: Menampilkan kartu bergambar yang bersumber dari aset lokal (`assets/images/test1.jpg`) dan gambar daring melalui jaringan internet (`Image.network`).

---

### 📌 Pertemuan 06: Grid View (Multi-Kolom)
* **Fokus**: Menata antarmuka berbasis kisi (*grid*) dengan kombinasi ikon, teks, dan gambar.
* **Komponen & Berkas**: `lib/widget/pertemuan06/grid_view_update.dart` & `grid_view.dart`
* **Fitur**:
  * Menggunakan `GridView.count` dengan konfigurasi 2 kolom (`crossAxisCount: 2`).
  * Mengatur jarak antar kisi menggunakan `crossAxisSpacing` dan `mainAxisSpacing`.
  * Menampilkan variasi item berikon, item gambar dari aset lokal (`test1.jpg` dan `test2.jpg`), serta gambar dari internet URL.

---

### 📌 Pertemuan 07: Data Table
* **Fokus**: Penyajian data tabular (baris dan kolom) yang rapi dan terstruktur.
* **Komponen & Berkas**: `lib/widget/pertemuan07/data_table.dart`
* **Fitur**:
  * Menggunakan widget `DataTable` dengan pendefinisian kolom (`DataColumn`: No, NIM, Nama, Prodi).
  * Pengisian baris data mahasiswa (`DataRow` dan `DataCell`).
  * Dibungkus dengan `SingleChildScrollView` horizontal dan `ListView` vertikal agar tabel responsif dan tidak mengalami error *overflow* pada layar perangkat yang lebih kecil.

---

## 📂 Struktur Proyek Terpadu

Seluruh modul praktikum telah disatukan ke dalam satu aplikasi Flutter terpadu dengan sistem dashboard navigasi:

```text
lib/
├── main.dart                  # Titik masuk aplikasi & tema Flutter
├── menu_utama.dart            # Dashboard navigasi utama pertemuan 01 - 07
└── widget/
    ├── pertemuan01/           # Praktikum 01: UI Biodata Diri
    ├── pertemuan02/           # Praktikum 02: Linear Layout (Column & Row)
    ├── pertemuan03/           # Praktikum 03: Linear & Relative Layout
    ├── pertemuan04/           # Praktikum 04: List View Vertical
    ├── pertemuan05/           # Praktikum 05: List View Horizontal & Card Image
    ├── pertemuan06/           # Praktikum 06: Grid View (Multi-Kolom)
    └── pertemuan07/           # Praktikum 07: Data Table (Tabel Data Mahasiswa)
assets/
└── images/                    # Aset gambar lokal (test1.jpg, test2.jpg)
```

---

## 🚀 Cara Menjalankan

1. Pasang dependensi Flutter:
   ```bash
   flutter pub get
   ```

2. Jalankan aplikasi:
   ```bash
   flutter run
   ```

3. Pada menu utama aplikasi, pilih modul pertemuan yang ingin dibuka melalui tombol yang tersedia (Pertemuan 01 s/d 07).

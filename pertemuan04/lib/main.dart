// ============================================================
// FORM PENDAFTARAN WORKSHOP CODING (MULTI-PAGE DART)
// Implementasi Input & Object Kontrol (Modul XI) berbasis Studi Kasus
//
// Struktur Navigasi (Navigator.push & Passing Data):
//   1. HalamanSatu : TextFormField (Nama, Email) & Dropdown (Bidang)
//   2. HalamanDua  : RadioGroup (Tingkat), Checkbox Multi (Bawaan), Switch (WA)
//   3. HalamanTiga : Card Ringkasan, Checkbox Tunggal (Persetujuan), & Submit
// ============================================================

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// ------------------------------------------------------------
// MODEL DATA BERSAMA
// ------------------------------------------------------------
class DataPendaftaran {
  String nama = '';
  String email = '';
  String kategori = 'Mobile Flutter';
  String tingkat = 'PEMULA';
  List<String> perlengkapan = [];
  bool notifikasiWa = true;
  bool setujuSyarat = false;
}

// ------------------------------------------------------------
// APLIKASI UTAMA DENGAN TEMA CLEAN, MODERN & CENTERED
// ------------------------------------------------------------
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pendaftaran Workshop Coding',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.indigo, width: 1.8),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.redAccent),
          ),
        ),
      ),
      home: const HalamanSatu(),
    );
  }
}

// ------------------------------------------------------------
// WIDGET BANTU: FORM SCAFFOLD (PUSAT LAYOUT & STEP HEADER)
// ------------------------------------------------------------
class FormScaffold extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final int step;
  final Widget child;

  const FormScaffold({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.step,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Workshop Coding 2026',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF64748B),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (ctx, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 520),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Header Terpusat
                      Center(
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: const Color(0x143F51B5),
                              child: Icon(icon, color: Colors.indigo, size: 24),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0F172A),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              subtitle,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Color(0xFF64748B),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Step Indicator
                      _buildStepBar(step),
                      const SizedBox(height: 16),
                      child,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStepBar(int activeStep) {
    final labels = ['Data Diri', 'Preferensi', 'Konfirmasi'];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x050F172A),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: List.generate(5, (i) {
          if (i.isOdd) {
            final isDone = activeStep > (i ~/ 2) + 1;
            return Expanded(
              child: Container(
                height: 2,
                color: isDone ? Colors.indigo : const Color(0xFFE2E8F0),
                margin: const EdgeInsets.symmetric(horizontal: 4),
              ),
            );
          }
          final idx = i ~/ 2;
          final num = idx + 1;
          final isCur = activeStep == num;
          final isDone = activeStep > num;
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 12,
                backgroundColor: isDone || isCur
                    ? Colors.indigo
                    : const Color(0xFFF1F5F9),
                child: isDone
                    ? const Icon(Icons.check, size: 14, color: Colors.white)
                    : Text(
                        '$num',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: isCur ? Colors.white : const Color(0xFF64748B),
                        ),
                      ),
              ),
              const SizedBox(width: 4),
              Text(
                labels[idx],
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: isCur ? FontWeight.bold : FontWeight.w500,
                  color: isCur
                      ? const Color(0xFF0F172A)
                      : const Color(0xFF64748B),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

// ------------------------------------------------------------
// WIDGET BANTU: CONTAINER CARD KELOMPOK FORM
// ------------------------------------------------------------
class FormCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget child;

  const FormCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x060F172A),
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: const Color(0x143F51B5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: Colors.indigo, size: 18),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 24, color: Color(0xFFF1F5F9)),
          child,
        ],
      ),
    );
  }
}

// ============================================================
// HALAMAN 1: IDENTITAS & PEMINATAN
// ============================================================
class HalamanSatu extends StatefulWidget {
  const HalamanSatu({super.key});

  @override
  State<HalamanSatu> createState() => _HalamanSatuState();
}

class _HalamanSatuState extends State<HalamanSatu> {
  final _formKey = GlobalKey<FormState>();
  final DataPendaftaran data = DataPendaftaran();
  final _namaCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final List<String> kategoriList = [
    'Mobile Flutter',
    'Web Frontend',
    'Backend API',
    'UI/UX Design',
  ];

  @override
  void dispose() {
    _namaCtrl.dispose();
    _emailCtrl.dispose();
    super.dispose();
  }

  void _lanjut() {
    if (_formKey.currentState!.validate()) {
      data.nama = _namaCtrl.text.trim();
      data.email = _emailCtrl.text.trim();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (ctx) => HalamanDua(data: data)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormScaffold(
      title: 'Pendaftaran Workshop Coding',
      subtitle: 'Langkah 1 dari 3: Identitas & Peminatan Materi',
      icon: Icons.app_registration_rounded,
      step: 1,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            FormCard(
              title: 'Data Diri Peserta',
              subtitle: 'Informasi untuk pembuatan e-sertifikat',
              icon: Icons.person_outline_rounded,
              child: Column(
                children: [
                  TextFormField(
                    controller: _namaCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Nama Lengkap',
                      hintText: 'Contoh: Ahmad Rizky',
                      prefixIcon: Icon(Icons.badge_outlined),
                    ),
                    validator: (v) => (v == null || v.trim().isEmpty)
                        ? 'Nama wajib diisi'
                        : null,
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Alamat Email',
                      hintText: 'nama@domain.com',
                      prefixIcon: Icon(Icons.mail_outline_rounded),
                    ),
                    validator: (v) =>
                        (v == null || !v.contains('@') || !v.contains('.'))
                        ? 'Email tidak valid'
                        : null,
                  ),
                ],
              ),
            ),
            FormCard(
              title: 'Bidang Peminatan',
              subtitle: 'Pilih topik workshop yang ingin dipelajari',
              icon: Icons.school_outlined,
              child: DropdownButtonFormField<String>(
                initialValue: data.kategori,
                decoration: const InputDecoration(
                  labelText: 'Pilihan Materi',
                  prefixIcon: Icon(Icons.code_rounded),
                ),
                items: kategoriList
                    .map(
                      (kat) => DropdownMenuItem(value: kat, child: Text(kat)),
                    )
                    .toList(),
                onChanged: (val) {
                  if (val != null) setState(() => data.kategori = val);
                },
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 48,
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _lanjut,
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: const Text(
                  'Lanjut ke Preferensi',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// HALAMAN 2: PREFERENSI & PERLENGKAPAN
// ============================================================
enum Tingkat { pemula, menengah, mahir }

class HalamanDua extends StatefulWidget {
  final DataPendaftaran data;
  const HalamanDua({super.key, required this.data});

  @override
  State<HalamanDua> createState() => _HalamanDuaState();
}

class _HalamanDuaState extends State<HalamanDua> {
  Tingkat? _tingkatDipilih = Tingkat.pemula;
  final Map<String, bool> _perlengkapan = {
    'Laptop Pribadi': true,
    'Charger Laptop': true,
    'Mouse Eksternal': false,
  };

  void _lanjut() {
    widget.data.tingkat = _tingkatDipilih!.name.toUpperCase();
    widget.data.perlengkapan = _perlengkapan.entries
        .where((e) => e.value)
        .map((e) => e.key)
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => HalamanTiga(data: widget.data)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormScaffold(
      title: 'Preferensi Belajar & Kesiapan',
      subtitle: 'Langkah 2 dari 3: Sesuaikan tingkat materi dan perlengkapan',
      icon: Icons.tune_rounded,
      step: 2,
      child: Column(
        children: [
          FormCard(
            title: 'Tingkat Kemampuan',
            subtitle: 'Sesuaikan materi agar pas dengan pemahamanmu',
            icon: Icons.trending_up_rounded,
            child: RadioGroup<Tingkat>(
              groupValue: _tingkatDipilih,
              onChanged: (val) {
                if (val != null) setState(() => _tingkatDipilih = val);
              },
              child: Column(
                children: [
                  _radioOption(
                    Tingkat.pemula,
                    'Pemula',
                    'Belum punya dasar coding',
                    Icons.eco_outlined,
                  ),
                  const SizedBox(height: 8),
                  _radioOption(
                    Tingkat.menengah,
                    'Menengah',
                    'Paham sintaks dasar & logika',
                    Icons.code_rounded,
                  ),
                  const SizedBox(height: 8),
                  _radioOption(
                    Tingkat.mahir,
                    'Mahir',
                    'Terbiasa membangun aplikasi',
                    Icons.rocket_launch_outlined,
                  ),
                ],
              ),
            ),
          ),
          FormCard(
            title: 'Perlengkapan yang Siap Dibawa',
            subtitle: 'Peralatan untuk sesi praktik langsung',
            icon: Icons.inventory_2_outlined,
            child: Column(
              children: [
                _checkOption('Laptop Pribadi', Icons.laptop_mac_outlined),
                const SizedBox(height: 8),
                _checkOption('Charger Laptop', Icons.power_outlined),
                const SizedBox(height: 8),
                _checkOption('Mouse Eksternal', Icons.mouse_outlined),
              ],
            ),
          ),
          // WhatsApp Switch
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE2E8F0)),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x060F172A),
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFDCFCE7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.notifications_active_outlined,
                    color: Color(0xFF16A34A),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pengingat via WhatsApp',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      Text(
                        'Kirim modul & link Zoom H-1 workshop',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: widget.data.notifikasiWa,
                  activeThumbColor: Colors.indigo,
                  onChanged: (v) =>
                      setState(() => widget.data.notifikasiWa = v),
                ),
              ],
            ),
          ),
          Row(
            children: [
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF475569),
                  side: const BorderSide(color: Color(0xFFCBD5E1)),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Kembali'),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: _lanjut,
                    icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                    label: const Text(
                      'Lanjut ke Ringkasan',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _radioOption(Tingkat val, String title, String sub, IconData icon) {
    final sel = _tingkatDipilih == val;
    return InkWell(
      onTap: () => setState(() => _tingkatDipilih = val),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: sel ? const Color(0x0C3F51B5) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: sel ? Colors.indigo : const Color(0xFFE2E8F0),
            width: sel ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Radio<Tingkat>(value: val, activeColor: Colors.indigo),
            const SizedBox(width: 4),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: sel
                          ? Colors.indigo.shade900
                          : const Color(0xFF0F172A),
                    ),
                  ),
                  Text(
                    sub,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              icon,
              size: 20,
              color: sel ? Colors.indigo : const Color(0xFF94A3B8),
            ),
          ],
        ),
      ),
    );
  }

  Widget _checkOption(String title, IconData icon) {
    final checked = _perlengkapan[title] ?? false;
    return InkWell(
      onTap: () => setState(() => _perlengkapan[title] = !checked),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: checked ? const Color(0xFFF8FAFC) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Row(
          children: [
            Checkbox(
              value: checked,
              activeColor: Colors.indigo,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              onChanged: (v) =>
                  setState(() => _perlengkapan[title] = v ?? false),
            ),
            Icon(icon, size: 20, color: const Color(0xFF64748B)),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1E293B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// HALAMAN 3: RINGKASAN & KONFIRMASI
// ============================================================
class HalamanTiga extends StatefulWidget {
  final DataPendaftaran data;
  const HalamanTiga({super.key, required this.data});

  @override
  State<HalamanTiga> createState() => _HalamanTigaState();
}

class _HalamanTigaState extends State<HalamanTiga> {
  bool _setuju = false;
  bool _errorSetuju = false;

  void _submit() {
    if (!_setuju) {
      setState(() => _errorSetuju = true);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Harap centang persetujuan sebelum mengirim!'),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final noReg =
        'WS-${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}';
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundColor: Color(0xFFDCFCE7),
                  child: Icon(
                    Icons.check_circle_rounded,
                    color: Color(0xFF16A34A),
                    size: 36,
                  ),
                ),
                const SizedBox(height: 14),
                const Text(
                  'Pendaftaran Berhasil!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Formulir pendaftaran kamu telah resmi dikonfirmasi sistem.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.5, color: Color(0xFF64748B)),
                ),
                const SizedBox(height: 14),
                // E-Pass Card
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'BUKTI REGISTRASI',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo,
                              letterSpacing: 0.5,
                            ),
                          ),
                          Text(
                            '#$noReg',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo.shade800,
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 16),
                      _ticketRow('Nama Peserta', widget.data.nama),
                      _ticketRow('Materi Pilihan', widget.data.kategori),
                      _ticketRow('Tingkat', widget.data.tingkat),
                      _ticketRow(
                        'Notifikasi WA',
                        widget.data.notifikasiWa ? 'Aktif (H-1)' : 'Non-aktif',
                        isHighlight: widget.data.notifikasiWa,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.mark_email_read_outlined,
                        size: 16,
                        color: Color(0xFF2563EB),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Modul & Zoom dikirim ke: ${widget.data.email}',
                          style: const TextStyle(
                            fontSize: 11.5,
                            color: Color(0xFF1E40AF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.popUntil(context, (r) => r.isFirst),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Selesai & Kembali ke Awal',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _ticketRow(String k, String v, {bool isHighlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            k,
            style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
          ),
          Text(
            v,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isHighlight
                  ? const Color(0xFF16A34A)
                  : const Color(0xFF0F172A),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormScaffold(
      title: 'Ringkasan & Konfirmasi',
      subtitle:
          'Langkah 3 dari 3: Periksa kembali seluruh data sebelum dikirim',
      icon: Icons.fact_check_outlined,
      step: 3,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE2E8F0)),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x060F172A),
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0x1A3F51B5),
                      child: Icon(Icons.person, color: Colors.indigo, size: 22),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.data.nama,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                          Text(
                            widget.data.email,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF64748B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(height: 24, color: Color(0xFFF1F5F9)),
                _summaryRow(
                  'Bidang Peminatan',
                  widget.data.kategori,
                  badge: true,
                ),
                _summaryRow(
                  'Tingkat Kemampuan',
                  widget.data.tingkat,
                  badge: true,
                ),
                _summaryRow(
                  'Perlengkapan',
                  widget.data.perlengkapan.isEmpty
                      ? 'Tidak membawa'
                      : widget.data.perlengkapan.join(', '),
                ),
                _summaryRow(
                  'Notifikasi WA',
                  widget.data.notifikasiWa ? 'Aktif' : 'Non-aktif',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Checkbox Persetujuan
          InkWell(
            onTap: () => setState(() {
              _setuju = !_setuju;
              if (_setuju) _errorSetuju = false;
            }),
            borderRadius: BorderRadius.circular(14),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: _errorSetuju
                    ? const Color(0xFFFEF2F2)
                    : (_setuju ? const Color(0x0C3F51B5) : Colors.white),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: _errorSetuju
                      ? Colors.redAccent
                      : (_setuju ? Colors.indigo : const Color(0xFFE2E8F0)),
                  width: (_errorSetuju || _setuju) ? 1.5 : 1,
                ),
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: _setuju,
                    activeColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    onChanged: (v) => setState(() {
                      _setuju = v ?? false;
                      if (_setuju) _errorSetuju = false;
                    }),
                  ),
                  const Expanded(
                    child: Text(
                      'Saya menyatakan bahwa seluruh informasi di atas adalah benar dan siap mengikuti workshop.',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF334155),
                        height: 1.35,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_errorSetuju)
            const Padding(
              padding: EdgeInsets.only(top: 6, left: 8),
              child: Text(
                '* Harap centang persetujuan terlebih dahulu',
                style: TextStyle(fontSize: 12, color: Colors.redAccent),
              ),
            ),
          const SizedBox(height: 20),
          Row(
            children: [
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF475569),
                  side: const BorderSide(color: Color(0xFFCBD5E1)),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Kembali'),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: _submit,
                    icon: const Icon(Icons.send_rounded, size: 18),
                    label: const Text(
                      'Kirim Pendaftaran',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(String label, String value, {bool badge = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          SizedBox(
            width: 130,
            child: Text(
              label,
              style: const TextStyle(fontSize: 13, color: Color(0xFF64748B)),
            ),
          ),
          Expanded(
            child: badge
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0x143F51B5),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        value,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.indigo.shade900,
                        ),
                      ),
                    ),
                  )
                : Text(
                    value,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0F172A),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

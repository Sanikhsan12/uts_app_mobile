import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BiodataPage extends StatefulWidget {
  const BiodataPage({super.key});

  @override
  State<BiodataPage> createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  late final GlobalKey<FormState> _formkey;
  late final TextEditingController _namaController;
  late final TextEditingController _nimController;
  late final TextEditingController _tglLahirController;
  String? _selectedGender;
  DateTime? _selectedDate;

  // ! Init State
  @override
  void initState() {
    super.initState();
    _formkey = GlobalKey<FormState>();
    _namaController = TextEditingController();
    _nimController = TextEditingController();
    _tglLahirController = TextEditingController();
  }

  // ! Clear widgets after submit
  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _tglLahirController.dispose();
    super.dispose();
  }

  // ! Date Picker
  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _tglLahirController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  // ! Form Submiter
  void _submitForm() {
    // Validasi ada di sini
    if (_formkey.currentState!.validate()) {
      // ! variabel data
      final nama = _namaController.text;
      final nim = _nimController.text;
      final gender = _selectedGender;
      final tglLahir = _tglLahirController.text;

      // ! Notif
      final message =
          'Data Diterima:\nNama: $nama\nNIM: $nim\nJenis Kelamin: $gender\nTanggal Lahir: $tglLahir';

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.cyan,
          duration: const Duration(seconds: 3),
        ),
      );
      // ! Clear Form setelah submit
      _clearForm();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Mohon lengkapi semua field!'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  // ! Clear Form
  void _clearForm() {
    _formkey.currentState?.reset();
    _namaController.clear();
    _nimController.clear();
    _tglLahirController.clear();
    setState(() {
      _selectedGender = null;
      _selectedDate = null;
    });
  }

  // ! Main Widget
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileCard(),
              const SizedBox(height: 20),
              _buildFormCard(),
            ],
          ),
        ),
      ),
    );
  }

  // ! Profile Card Widget Builder
  Widget _buildProfileCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          ClipOval(
            child: Image.asset(
              'assets/images/splash_logo.png',
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Muhammad Ikhsan',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '15-2022-001',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  // ! Form Card Widget Builder
  Widget _buildFormCard() {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(15.0),
      ),
      // 'Form' dan 'key' Anda sekarang aman di sini
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Biodata Form',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            // ! Form Fields Nama
            TextFormField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: 'Nama Lengkap',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Mohon masukkan nama lengkap';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            // ! Form Fields NIM
            TextFormField(
              controller: _nimController,
              decoration: const InputDecoration(
                labelText: 'NIM',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Mohon masukkan NIM';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            // ! Form Fields Jenis Kelamin
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Jenis Kelamin',
                border: OutlineInputBorder(),
              ),
              value: _selectedGender,
              items: const [
                DropdownMenuItem(value: 'Laki-laki', child: Text('Laki-laki')),
                DropdownMenuItem(value: 'Perempuan', child: Text('Perempuan')),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedGender = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Mohon pilih jenis kelamin';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            // ! Form Fields Tanggal Lahir
            TextFormField(
              controller: _tglLahirController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Tanggal Lahir',
                border: OutlineInputBorder(),
              ),
              onTap: () => _pickDate(context),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Mohon pilih tanggal lahir';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            // ! Submit Button
            ElevatedButton(
              // --- PERBAIKAN 2: Langsung panggil _submitForm ---
              onPressed: _submitForm,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HalamanPengaturanKota extends StatefulWidget {
  const HalamanPengaturanKota({super.key});

  @override
  State<HalamanPengaturanKota> createState() => _HalamanPengaturanKotaState();
}
class _HalamanPengaturanKotaState extends State<HalamanPengaturanKota> {
  bool _notifikasi = true;
  bool _lokasi = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pengaturan Kota')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Notifikasi layanan'),
            value: _notifikasi,
            onChanged: (v) => setState(() => _notifikasi = v),
          ),
          SwitchListTile(
            title: const Text('Gunakan lokasi saya'),
            value: _lokasi,
            onChanged: (v) => setState(() => _lokasi = v),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.bug_report_outlined),
            title: const Text('Uji Route Salah'),
            subtitle: const Text('Memanggil nama route yang tidak terdaftar'),
            // Sengaja memakai nama route yang tidak terdaftar.
            onTap: () => Navigator.pushNamed(context, '/layanan-tidak-ada'),
          ),
        ],
      ),
    );
  }
}

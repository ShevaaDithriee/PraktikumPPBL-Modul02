import 'package:flutter/material.dart';
import '../navigation/app_routes.dart';

class HalamanWarga extends StatelessWidget {
  const HalamanWarga({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Center(child: CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40))),
        const SizedBox(height: 12),
        const Center(child: Text('Budi Santoso', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        const Center(child: Text('NIK 3200 **** **** 0001')),
        const SizedBox(height: 16),
        const Card(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.home_outlined),
                title: Text('Alamat'),
                subtitle: Text('Jl. Merdeka No. 10, Kota Nusantara'),
              ),
              ListTile(
                leading: Icon(Icons.phone_outlined),
                title: Text('Telepon'),
                subtitle: Text('0812-0000-0000'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        FilledButton.icon(
          onPressed: () => Navigator.pushNamed(context, AppRoutes.riwayatLaporan),
          icon: const Icon(Icons.history),
          label: const Text('Riwayat Laporan'),
        ),
      ],
    );
  }
}

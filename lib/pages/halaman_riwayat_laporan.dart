import 'package:flutter/material.dart';

class HalamanRiwayatLaporan extends StatelessWidget {
  const HalamanRiwayatLaporan({super.key});

  static const List<(String, String, IconData)> _laporan = [
    ('Jalan berlubang di Jl. Merdeka', 'Selesai', Icons.check_circle),
    ('Lampu jalan padam di Jl. Melati', 'Diproses', Icons.hourglass_top),
    ('Sampah menumpuk di Pasar Baru', 'Diproses', Icons.hourglass_top),
    ('Saluran air tersumbat', 'Diterima', Icons.mark_email_read),
  ];
  void _pesan(BuildContext context, String teks) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(teks)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat Laporan')),
      body: ListView.separated(
        itemCount: _laporan.length,
        separatorBuilder: (context, i) => const Divider(height: 1),
        itemBuilder: (context, i) {
          final (judul, status, ikon) = _laporan[i];
          return ListTile(
            leading: Icon(ikon),
            title: Text(judul),
            subtitle: Text('Status: $status'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _pesan(context, 'Buat laporan baru'),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              tooltip: 'Cari',
              icon: const Icon(Icons.search),
              onPressed: () => _pesan(context, 'Cari laporan'),
            ),
            IconButton(
              tooltip: 'Filter',
              icon: const Icon(Icons.filter_list),
              onPressed: () => _pesan(context, 'Filter laporan'),
            ),
            const SizedBox(width: 40), // ruang untuk FAB
            IconButton(
              tooltip: 'Urutkan',
              icon: const Icon(Icons.sort),
              onPressed: () => _pesan(context, 'Urutkan laporan'),
            ),
            IconButton(
              tooltip: 'Lainnya',
              icon: const Icon(Icons.more_vert),
              onPressed: () => _pesan(context, 'Menu lainnya'),
            ),
          ],
        ),
      ),
    );
  }
}

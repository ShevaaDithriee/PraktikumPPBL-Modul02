import 'package:flutter/material.dart';
import '../data/data_layanan.dart';

class HalamanRincianLayanan extends StatelessWidget {
  const HalamanRincianLayanan({super.key, required this.layanan});
  final Layanan layanan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(layanan.nama)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(child: Icon(layanan.ikon, size: 64, color: Theme.of(context).colorScheme.primary)),
          const SizedBox(height: 12),
          Text(
            layanan.nama,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.apartment),
            title: const Text('Dinas Penanggung Jawab'),
            subtitle: Text(layanan.dinas),
          ),
          ListTile(
            leading: const Icon(Icons.schedule),
            title: const Text('Jam Operasional'),
            subtitle: Text(layanan.jamOperasional),
          ),
          ListTile(
            leading: const Icon(Icons.description_outlined),
            title: const Text('Keterangan'),
            subtitle: Text(layanan.keterangan),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Kembali'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton(
                  onPressed: () => Navigator.pop(
                    context,
                    'Permohonan ${layanan.nama} telah diajukan',
                  ),
                  child: const Text('Ajukan Permohonan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

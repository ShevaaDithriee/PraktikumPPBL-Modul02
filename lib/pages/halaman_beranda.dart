import 'package:flutter/material.dart';
import '../data/data_layanan.dart';

class HalamanBeranda extends StatelessWidget {
  const HalamanBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Selamat datang di Kota Nusantara', style: tema.textTheme.titleLarge),
        const SizedBox(height: 4),
        Text('Ringkasan enam pilar smart city', style: tema.textTheme.bodyMedium),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, batas) {
            final int kolom = batas.maxWidth >= 600 ? 3 : 2;
            return GridView.count(
              crossAxisCount: kolom,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.3,
              children: [
                for (final p in DataLayanan.pilar) _KartuPilar(pilar: p),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _KartuPilar extends StatelessWidget {
  const _KartuPilar({required this.pilar});
  final PilarSmartCity pilar;

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;
    return Card(
      color: warna.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(pilar.ikon, size: 32, color: warna.primary),
            Text(pilar.judul, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(pilar.ringkasan, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

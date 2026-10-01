import 'package:flutter/material.dart';
import '../data/data_layanan.dart';
import '../pages/halaman_keluar.dart';
import '../pages/halaman_pengaturan_kota.dart';
import '../pages/halaman_rincian_layanan.dart';
import '../pages/halaman_riwayat_laporan.dart';
import '../pages/halaman_tentang.dart';
import 'kerangka_navigasi.dart';

class AppRoutes {
  static const String beranda = '/';
  static const String rincianLayanan = '/rincian-layanan';
  static const String riwayatLaporan = '/riwayat-laporan';
  static const String pengaturanKota = '/pengaturan-kota';
  static const String tentang = '/tentang';
  static const String keluar = '/keluar';
  static Map<String, WidgetBuilder> daftarRoute() {
    return {
      beranda: (context) => const KerangkaNavigasi(),
      riwayatLaporan: (context) => const HalamanRiwayatLaporan(),
      pengaturanKota: (context) => const HalamanPengaturanKota(),
      tentang: (context) => const HalamanTentang(),
      keluar: (context) => const HalamanKeluar(),
    };
  }
  static Route<dynamic>? bentukRoute(RouteSettings settings) {
    if (settings.name == rincianLayanan) {
      final argumen = settings.arguments;
      if (argumen is Layanan) {
        return MaterialPageRoute<String>(
          settings: settings,
          builder: (context) => HalamanRincianLayanan(layanan: argumen),
        );
      }
    }
    return null;
  }
  static Route<dynamic> routeTidakDikenal(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => Scaffold(
        appBar: AppBar(title: const Text('Route Tidak Ditemukan')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error_outline, size: 64, color: Colors.red),
                const SizedBox(height: 12),
                Text(
                  'Route "${settings.name}" belum terdaftar.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Kembali'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

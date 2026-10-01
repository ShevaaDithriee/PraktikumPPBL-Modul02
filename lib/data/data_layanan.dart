import 'package:flutter/material.dart';

class Layanan {
  final String nama;
  final String dinas;
  final String jamOperasional;
  final String keterangan;
  final IconData ikon;
  const Layanan({
    required this.nama,
    required this.dinas,
    required this.jamOperasional,
    required this.keterangan,
    required this.ikon,
  });
}
class PilarSmartCity {
  final String judul;
  final String ringkasan;
  final IconData ikon;

  const PilarSmartCity(this.judul, this.ringkasan, this.ikon);
}
class DataLayanan {
  static const List<PilarSmartCity> pilar = [
    PilarSmartCity('Smart Governance', '24 layanan daring aktif', Icons.account_balance),
    PilarSmartCity('Smart Branding', '12 agenda wisata bulan ini', Icons.campaign),
    PilarSmartCity('Smart Economy', '1.250 UMKM terdaftar', Icons.storefront),
    PilarSmartCity('Smart Living', '8 fasilitas kesehatan terhubung', Icons.health_and_safety),
    PilarSmartCity('Smart Society', '3.480 warga terdaftar', Icons.groups),
    PilarSmartCity('Smart Environment', 'Indeks udara: baik', Icons.eco),
  ];
  static const List<Layanan> perizinan = [
    Layanan(
      nama: 'Izin Usaha',
      dinas: 'Dinas Penanaman Modal dan PTSP',
      jamOperasional: 'Senin-Jumat, 08.00-15.00',
      keterangan: 'Pengajuan Nomor Induk Berusaha dan izin usaha mikro, kecil, dan menengah.',
      ikon: Icons.business_center,
    ),
    Layanan(
      nama: 'Izin Mendirikan Bangunan',
      dinas: 'Dinas Pekerjaan Umum dan Penataan Ruang',
      jamOperasional: 'Senin-Jumat, 08.00-15.00',
      keterangan: 'Persetujuan bangunan gedung untuk rumah tinggal dan bangunan usaha.',
      ikon: Icons.apartment,
    ),
    Layanan(
      nama: 'Izin Keramaian',
      dinas: 'Satuan Polisi Pamong Praja',
      jamOperasional: 'Senin-Sabtu, 08.00-14.00',
      keterangan: 'Pemberitahuan dan izin kegiatan yang mengundang banyak peserta.',
      ikon: Icons.celebration,
    ),
  ];
  static const List<Layanan> kesehatan = [
    Layanan(
      nama: 'Pendaftaran Puskesmas',
      dinas: 'Dinas Kesehatan',
      jamOperasional: 'Setiap hari, 07.00-12.00',
      keterangan: 'Pendaftaran antrean pemeriksaan umum di puskesmas terdekat.',
      ikon: Icons.local_hospital,
    ),
    Layanan(
      nama: 'Imunisasi Anak',
      dinas: 'Dinas Kesehatan',
      jamOperasional: 'Selasa dan Kamis, 08.00-11.00',
      keterangan: 'Jadwal dan pendaftaran imunisasi dasar lengkap untuk balita.',
      ikon: Icons.vaccines,
    ),
    Layanan(
      nama: 'Ambulans Gawat Darurat',
      dinas: 'Pusat Layanan Darurat 112',
      jamOperasional: '24 jam',
      keterangan: 'Permintaan ambulans untuk kondisi gawat darurat di dalam kota.',
      ikon: Icons.emergency,
    ),
  ];
  static const List<Layanan> transportasi = [
    Layanan(
      nama: 'Jadwal Bus Kota',
      dinas: 'Dinas Perhubungan',
      jamOperasional: 'Setiap hari, 05.00-21.00',
      keterangan: 'Informasi rute, halte, dan jadwal keberangkatan bus kota.',
      ikon: Icons.directions_bus,
    ),
    Layanan(
      nama: 'Uji Kendaraan Berkala',
      dinas: 'Dinas Perhubungan',
      jamOperasional: 'Senin-Jumat, 08.00-15.00',
      keterangan: 'Pendaftaran jadwal uji berkala kendaraan angkutan umum dan barang.',
      ikon: Icons.fact_check,
    ),
    Layanan(
      nama: 'Parkir Tepi Jalan',
      dinas: 'Dinas Perhubungan',
      jamOperasional: 'Setiap hari, 06.00-22.00',
      keterangan: 'Informasi titik parkir resmi dan tarif parkir tepi jalan umum.',
      ikon: Icons.local_parking,
    ),
  ];
}

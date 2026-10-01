import 'package:flutter/material.dart';
import '../pages/halaman_beranda.dart';
import '../pages/halaman_layanan.dart';
import '../pages/halaman_warga.dart';
import 'app_routes.dart';

class _Tujuan {
  final String label;
  final IconData ikon;
  final IconData ikonTerpilih;
  const _Tujuan(this.label, this.ikon, this.ikonTerpilih);
}
class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});
  @override
  State<KerangkaNavigasi> createState() => _KerangkaNavigasiState();
}
class _KerangkaNavigasiState extends State<KerangkaNavigasi> {
  static const double _ambangLayarLebar = 600;
  static const double _ambangRailPenuh = 900;
  int _indeks = 0;
  static const List<_Tujuan> _tujuan = [
    _Tujuan('Beranda', Icons.home_outlined, Icons.home),
    _Tujuan('Layanan', Icons.miscellaneous_services_outlined, Icons.miscellaneous_services),
    _Tujuan('Warga', Icons.person_outline, Icons.person),
  ];
  static const List<Widget> _halaman = [
    HalamanBeranda(),
    HalamanLayanan(),
    HalamanWarga(),
  ];
  void _pilihTujuan(int indeks) {
    setState(() => _indeks = indeks);
  }
  @override
  Widget build(BuildContext context) {
    final double lebar = MediaQuery.of(context).size.width;
    final bool layarLebar = lebar >= _ambangLayarLebar;
    return PopScope(
      canPop: _indeks == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) _pilihTujuan(0);
      },
      child: Scaffold(
        appBar: AppBar(title: Text(_tujuan[_indeks].label)),
        drawer: _buatDrawer(),
        body: layarLebar
            ? _tataLetakLebar(lebar >= _ambangRailPenuh)
            : _halaman[_indeks],
        bottomNavigationBar: layarLebar ? null : _buatBilahBawah(),
      ),
    );
  }
  Widget _buatBilahBawah() {
    return NavigationBar(
      selectedIndex: _indeks,
      onDestinationSelected: _pilihTujuan,
      destinations: [
        for (final t in _tujuan)
          NavigationDestination(
            icon: Icon(t.ikon),
            selectedIcon: Icon(t.ikonTerpilih),
            label: t.label,
          ),
      ],
    );
  }
  Widget _tataLetakLebar(bool extended) {
    return Row(
      children: [
        NavigationRail(
          selectedIndex: _indeks,
          onDestinationSelected: _pilihTujuan,
          extended: extended,
          labelType: extended ? null : NavigationRailLabelType.all,
          leading: const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Icon(Icons.location_city, size: 32),
          ),
          destinations: [
            for (final t in _tujuan)
              NavigationRailDestination(
                icon: Icon(t.ikon),
                selectedIcon: Icon(t.ikonTerpilih),
                label: Text(t.label),
              ),
          ],
        ),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(child: _halaman[_indeks]),
      ],
    );
  }
  Widget _buatDrawer() {
    return NavigationDrawer(
      selectedIndex: _indeks,
      onDestinationSelected: (indeks) {
        _pilihTujuan(indeks);
        Navigator.pop(context); // tutup drawer
      },
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text('Nusantara Cerdas'),
          accountEmail: Text('layanan@nusantara.go.id'),
          currentAccountPicture: CircleAvatar(child: Icon(Icons.location_city)),
        ),
        for (final t in _tujuan)
          NavigationDrawerDestination(
            icon: Icon(t.ikon),
            selectedIcon: Icon(t.ikonTerpilih),
            label: Text(t.label),
          ),
        const Divider(indent: 28, endIndent: 28),
        _itemPendukung(Icons.tune, 'Pengaturan Kota', AppRoutes.pengaturanKota),
        _itemPendukung(Icons.info_outline, 'Tentang Aplikasi', AppRoutes.tentang),
        _itemPendukung(Icons.logout, 'Keluar', AppRoutes.keluar),
      ],
    );
  }
  Widget _itemPendukung(IconData ikon, String judul, String namaRoute) {
    return ListTile(
      leading: Icon(ikon),
      title: Text(judul),
      onTap: () {
        Navigator.pop(context); // drawer ditutup dahulu
        Navigator.pushNamed(context, namaRoute);
      },
    );
  }
}

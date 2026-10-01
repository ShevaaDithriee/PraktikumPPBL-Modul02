import 'package:flutter/material.dart';
import '../data/data_layanan.dart';
import '../navigation/app_routes.dart';

class HalamanLayanan extends StatefulWidget {
  const HalamanLayanan({super.key});
  @override
  State<HalamanLayanan> createState() => _HalamanLayananState();
}
class _HalamanLayananState extends State<HalamanLayanan> {
  Future<void> _bukaRincian(Layanan layanan) async {
    final hasil = await Navigator.pushNamed<String>(
      context,
      AppRoutes.rincianLayanan,
      arguments: layanan,
    );
    if (!mounted || hasil == null) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(hasil)));
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.assignment), text: 'Perizinan'),
              Tab(icon: Icon(Icons.favorite), text: 'Kesehatan'),
              Tab(icon: Icon(Icons.directions_bus), text: 'Transportasi'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _daftar(DataLayanan.perizinan),
                _daftar(DataLayanan.kesehatan),
                _daftar(DataLayanan.transportasi),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _daftar(List<Layanan> daftar) {
    return ListView.separated(
      itemCount: daftar.length,
      separatorBuilder: (context, i) => const Divider(height: 1),
      itemBuilder: (context, i) {
        final layanan = daftar[i];
        return ListTile(
          leading: Icon(layanan.ikon),
          title: Text(layanan.nama),
          subtitle: Text(layanan.dinas),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => _bukaRincian(layanan),
        );
      },
    );
  }
}

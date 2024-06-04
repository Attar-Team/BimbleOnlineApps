import 'package:bumn_muda/data/histori_pemesanan.dart';
import 'package:bumn_muda/data/paket.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../../data/response/histori_pemesanan_response.dart';
import '../Histori Pemesanan/selesai_screen.dart';
import '../Histori Pemesanan/activeorders_screen.dart';


class PembelianPageScreen extends StatefulWidget {

  final List<HistoriPemesanan> historiPemesanan;
  final List<Package> list_paket;

  const PembelianPageScreen({Key? key, required this.historiPemesanan, required this.list_paket}) : super(key: key);

  @override
  State<PembelianPageScreen> createState() => _PembelianPageScreenState();
}

class _PembelianPageScreenState extends State<PembelianPageScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    print("Histori Pemesanan : ${widget.historiPemesanan.length}");
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            margin: const EdgeInsets.only(left: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2E3D64),
                    ),
                    children: [
                      TextSpan(
                        text: 'Histori ',
                        style: TextStyle(
                          // Gaya teks untuk "Video"
                          fontWeight: FontWeight.w500,
                          // Atur gaya teks sesuai keinginan Anda
                        ),
                      ),
                      TextSpan(
                        text: 'Pemesanan',
                        // Gaya teks untuk "Pembelajaran"
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  'Cek pemesanan dan proses course atau try out yang sudah kamu beli',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            unselectedLabelColor: Colors.grey,
            labelColor: Color(0xff2E3D64),
            indicatorColor: Color(0xff2E3D64),
            tabs: const [
              Tab(
                child: Text(
                  'Active Orders',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Selesai',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            ActiveOrdersScreen(data: widget.historiPemesanan.where((element) => element.status == "unpaid").toList(), dataPaket: widget.list_paket,),
            SelesaiScreen(data : widget.historiPemesanan.where((element) => element.status == "paid").toList(), dataPaket: widget.list_paket,),
          ],
        ),
      ),
    );
  }
}
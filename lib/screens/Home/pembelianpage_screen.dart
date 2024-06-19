import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../../card/Histori Pemesanan/activeorders_card.dart';
import '../../data/histori_pemesanan.dart';
import '../../data/paket.dart';
import '../../data/response/histori_pemesanan_response.dart';
import '../../data/response/paket_response.dart';
import '../../data/ujian.dart';
import '../Histori Pemesanan/selesai_screen.dart';
import '../Histori Pemesanan/activeorders_screen.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class PembelianPageScreen extends StatefulWidget {

  const PembelianPageScreen({Key? key}) : super(key: key);

  @override
  State<PembelianPageScreen> createState() => _PembelianPageScreenState();
}

class _PembelianPageScreenState extends State<PembelianPageScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<HistoriPemesanan> historiPemesanan = [];
  List<Package> list_packages = [];

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      fetchAllData();
    });
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

  }



  Future<void> fetchAllData() async {
    showLoadingDialog(context);
    try {
      final historiPemesananResponse = await fetchHistoriPemesanan();
      final paketResponse = await fetchPackages();
      setState(() {
        historiPemesanan = historiPemesananResponse.data;
        list_packages = paketResponse.data;
        print("Paket : ${list_packages.length}");
        print("Histori Pemesanan : ${historiPemesanan.length}");
      });
    } catch (e) {
      print('Failed to fetch data: $e');
    } finally {
      Navigator.pop(context);
    }
  }

  Future<ApiResponse> fetchPackages() async {
    final response = await http.get(Uri.parse('http://bimbel.adzazarif.my.id/api/package'));

    if (response.statusCode == 200) {
      return ApiResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load packages');
    }
  }

  Future<HistoriPemesananResponse> fetchHistoriPemesanan() async {
    final response = await http.get(Uri.parse('http://bimbel.adzazarif.my.id/api/history-transaction/1'));

    if (response.statusCode == 200) {
      return HistoriPemesananResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load histori pemesanan: ${response.body}');
    }
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Lottie.asset(
                'assets/animations/book_anim.json',
                width: 200,
                height: 200
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HistoriAppBar(tabController: _tabController),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: historiPemesanan.length,
          itemBuilder: (context, index) {
            return ActiveOrdersCard(
              judul: "",
              deskripsi: "",
              tanggal: historiPemesanan[index].date,
              imageURL: "",
              list_paket: list_packages,
              history: historiPemesanan[index],
            );
          },
        )
    );
  }
}

class HistoriAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;

  const HistoriAppBar({required this.tabController});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        margin: const EdgeInsets.only(left: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
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
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: 'Pemesanan',
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            const Text(
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 80); // Adjust the height as needed
}

class HistoriTabBarView extends StatelessWidget {
  final TabController tabController;
  final List<HistoriPemesanan> historiPemesanan;
  final List<Package> list_packages;

  const HistoriTabBarView({
    required this.tabController,
    required this.historiPemesanan,
    required this.list_packages,
  });

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: [
        ActiveOrdersScreen(
          data: historiPemesanan.where((element) => element.status == "unpaid").toList(),
          dataPaket: list_packages,
        ),
        SelesaiScreen(
          data: historiPemesanan.where((element) => element.status == "paid").toList(),
          dataPaket: list_packages,
        ),
      ],
    );
  }
}
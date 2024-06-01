import 'package:bumn_muda/data/histori_pemesanan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../../data/response/histori_pemesanan_response.dart';
import '../Histori Pemesanan/selesai_screen.dart';
import '../Histori Pemesanan/activeorders_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:lottie/lottie.dart';

class PembelianPageScreen extends StatefulWidget {
  const PembelianPageScreen({super.key});

  @override
  State<PembelianPageScreen> createState() => _PembelianPageScreenState();
}

class _PembelianPageScreenState extends State<PembelianPageScreen> {

  List<HistoriPemesanan> historiPemesanan = [];

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      fetchPaketTerbeli(context).then((apiResponse) {
        setState(() {
          historiPemesanan = apiResponse.data;
          for (var paket in historiPemesanan) {
            print(paket.toJson());
          }
        });
      }).catchError((error) {
        // Tangani kesalahan jika perlu
        print('Error fetching histori pemesanan: $error');
      });
    });
  }

  Future<HistoriPemesananResponse> fetchPaketTerbeli(BuildContext context) async {
    showLoadingDialog(context);
    try {
      final response = await http.get(Uri.parse('http://bimbel.adzazarif.my.id/api/history-transaction/1'));

      if (response.statusCode == 200) {
        Navigator.of(context).pop();
        return HistoriPemesananResponse.fromJson(json.decode(response.body));
      } else {
        Navigator.of(context).pop();
        throw Exception('Failed to load histori pemesanan : ${response.body}');
      }
    } catch (e) {
      Navigator.of(context).pop();
      throw e;
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
    return DefaultTabController(
      length: 2,
      child: Container(
        margin: EdgeInsets.only(top: 20),
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
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            bottom: const TabBar(
                unselectedLabelColor: Colors.grey,
                labelColor: Color(0xff2E3D64),
                indicatorColor: Color(0xff2E3D64),
                tabs: [
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
                ]),
          ),
          body: const TabBarView(
            children: [
              ActiveOrders_Screen(),
              SelesaiScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

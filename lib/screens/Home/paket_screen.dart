import 'dart:convert';

import 'package:bumn_muda/data/paket.dart';
import 'package:bumn_muda/screens/Paketku/detail_paketku.dart';
import 'package:flutter/material.dart';
import 'package:bumn_muda/card/paketku_card.dart';
import 'package:bumn_muda/card/paketku.dart';
import 'package:flutter/scheduler.dart';
import '../../data/paket_terbeli.dart';
import 'package:lottie/lottie.dart';
import '';
import 'package:http/http.dart' as http;
import '../../data/response/histori_pemesanan_response.dart';
import '../../data/response/paket_response.dart';
import '../../data/response/paket_terbeli_response.dart';

class PaketScreen extends StatefulWidget {
  const PaketScreen({Key? key}) : super(key: key);

  @override
  State<PaketScreen> createState() => _PaketScreenState();
}

class _PaketScreenState extends State<PaketScreen> {

  List<PaketTerbeli> paketTerbeli = [];
  List<Package> paket = [];

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      fetchAllData();
    });
  }

  Future<void> fetchAllData() async {
    showAboutDialog(context: context);
    try {
      final paketResponse = await fetchPackages();
      final paketTerbeliResponse = await fetchPaketTerbeli();
      setState(() {
        paket = paketResponse.data;
        paketTerbeli = paketTerbeliResponse.data;
        print("Paket Terbeli : ${paketTerbeli.length}");
        print("Paket : ${paket.length}");
      });
    } catch (e) {
      print('Failed to fetch data: $e');
    } finally {
      Navigator.of(context).pop();
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

  Future<PaketTerbeliResponse> fetchPaketTerbeli() async {
    final response = await http.get(Uri.parse('http://bimbel.adzazarif.my.id/api/purchased-package/1'));

    if (response.statusCode == 200) {
      return PaketTerbeliResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load paket terbeli: ${response.body}');
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
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage('images/logoapps.png'),
                      width: 150,
                      height: 50,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Paketku',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      'Berikut paket - paket course atau try out yang telah kamu beli ...',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 570, // Atur tinggi sesuai kebutuhan Anda
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: (paketTerbeli.length / 2).ceil(),
                  itemBuilder: (context, index) {
                    if ((index * 2) >= paketTerbeli.length) {
                      return Container(); // Atau widget lain untuk menangani kesalahan
                    }
                    return Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPaketku(productName: paket
                                        .where((paket) => paket.id.toString() == paketTerbeli[index * 2].packageId)
                                        .first
                                        .name, dataPaket : paket.where((paket) => paket.id.toString() == paketTerbeli[index * 2].packageId).first),
                                  ),
                                );
                              },
                              child: PaketkuCard(
                                imageURL: paket
                                    .where((paket) => paket.id.toString() == paketTerbeli[index * 2].packageId)
                                    .first
                                    .photo,
                                name: paket
                                    .where((paket) => paket.id.toString() == paketTerbeli[index * 2].packageId)
                                    .first
                                    .name,
                                description: paket
                                    .where((paket) => paket.id.toString() == paketTerbeli[index * 2].packageId)
                                    .first
                                    .description,
                                progress: "",
                              ),
                            ),
                          ),
                        ),
                        if ((index * 2 + 1) < paketTerbeli.length)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailPaketku(productName: paket
                                          .where((paket) => paket.id.toString() == paketTerbeli[index * 2 + 1].packageId)
                                          .first
                                          .name, dataPaket: paket.where((paket) => paket.id.toString() == paketTerbeli[index * 2 + 1].packageId).first),
                                    ),
                                  );
                                },
                                child: PaketkuCard(
                                  imageURL: paket
                                      .where((paket) => paket.id.toString() == paketTerbeli[index * 2 + 1].packageId)
                                      .first
                                      .photo,
                                  name: paket
                                      .where((paket) => paket.id.toString() == paketTerbeli[index * 2 + 1].packageId)
                                      .first
                                      .name,
                                  description: paket
                                      .where((paket) => paket.id.toString() == paketTerbeli[index * 2 + 1].packageId)
                                      .first
                                      .description,
                                  progress: "",
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                )
                ,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

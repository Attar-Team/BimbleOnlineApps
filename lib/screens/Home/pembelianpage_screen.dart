import 'package:flutter/material.dart';

import '../Histori Pemesanan/selesai_screen.dart';
import '../Histori Pemesanan/activeorders_screen.dart';

class PembelianPageScreen extends StatefulWidget {
  const PembelianPageScreen({super.key});

  @override
  State<PembelianPageScreen> createState() => _PembelianPageScreenState();
}

class _PembelianPageScreenState extends State<PembelianPageScreen> {
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

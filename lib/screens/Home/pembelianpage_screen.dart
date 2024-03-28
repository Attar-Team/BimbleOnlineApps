
import 'package:flutter/material.dart';

import '../Pembelian/ongoing_screen.dart';
import '../Pembelian/proses_screen.dart';
import '../Pembelian/selesai_screen.dart';

class PembelianPageScreen extends StatefulWidget {
  const PembelianPageScreen({super.key});

  @override
  State<PembelianPageScreen> createState() => _PembelianPageScreenState();
}

class _PembelianPageScreenState extends State<PembelianPageScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              margin: const EdgeInsets.only(left: 20, top: 20),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Histori Pemesanan',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      color: Colors.black
                    ),
                  ),
                  Text(
                    'Cek pemesanan dan proses course atau try out yang sudah kamu beli',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.black
                    ),
                  )
                ],
              ),
            ),
            bottom: const TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: Color(0xff2E3D64),
              tabs: [
                Tab(
                  child: Text(
                    'Proses',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'OnGoing',
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
                )
              ]),
          ),
          body: const TabBarView(
            children: [
              ProsesPembelian(),
              OnGoingScreen(),
              SelesaiPembelian(),
            ],
          ),
        ),
      ),
    );
  }
}

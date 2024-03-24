import 'package:bumn_muda/card/product_card.dart';
import 'package:flutter/material.dart';

class PembelianPageScreen extends StatefulWidget {
  const PembelianPageScreen({super.key});

  @override
  State<PembelianPageScreen> createState() => _PembelianPageScreenState();
}

class _PembelianPageScreenState extends State<PembelianPageScreen> {
  String selectedOptionJenis = '';
  String selectedOptionKategori = ''; // Variabel untuk melacak pilihan yang dipilih

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: 170,
                height: 30,
                child: Image.asset('images/logoapps.png'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            const Text(
              'Pembelian',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 23,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jenis',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: selectedOptionJenis == 'BUMN',
                            onChanged: (value) {
                              setState(() {
                                if (value!) {
                                  selectedOptionJenis = 'BUMN';
                                } else {
                                  selectedOptionJenis = '';
                                }
                              });
                            },
                            activeColor: Color(0xff2E3D64),
                            checkColor: Colors.white,
                          ),
                          Text(
                            'BUMN',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Checkbox(
                            value: selectedOptionJenis == 'CPNS',
                            onChanged: (value) {
                              setState(() {
                                if (value!) {
                                  selectedOptionJenis = 'CPNS';
                                } else {
                                  selectedOptionJenis = '';
                                }
                              });
                            },
                            activeColor: Color(0xff2E3D64),
                            checkColor: Colors.white,
                          ),
                          Text(
                            'CPNS',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kategori',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: selectedOptionKategori == 'Try Out',
                            onChanged: (value) {
                              setState(() {
                                if (value!) {
                                  selectedOptionKategori = 'Try Out';
                                } else {
                                  selectedOptionKategori = '';
                                }
                              });
                            },
                            activeColor: Color(0xff2E3D64),
                            checkColor: Colors.white,
                          ),
                          Text(
                            'BUMN',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Checkbox(
                            value: selectedOptionKategori == 'CPNS',
                            onChanged: (value) {
                              setState(() {
                                if (value!) {
                                  selectedOptionKategori = 'CPNS';
                                } else {
                                  selectedOptionKategori = '';
                                }
                              });
                            },
                            activeColor: Color(0xff2E3D64),
                            checkColor: Colors.white,
                          ),
                          Text(
                            'CPNS',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            ProductCard(imageURL: "images/gambarpaket.png",
            name: "Paket Try Out BUMN",
            description: "TKD, Ujian Simulasi, Tes Logika, Paket Soal Lengkap",
            price: "Rp50.000,00",)
          ],
        ),
      ),
    );
  }
}

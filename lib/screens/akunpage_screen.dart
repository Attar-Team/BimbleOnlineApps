import 'package:flutter/material.dart';
import 'package:bumn_muda/card/product_card.dart';

class AkunPageScreen extends StatefulWidget {
  const AkunPageScreen({super.key});

  @override
  State<AkunPageScreen> createState() => _AkunPageScreenState();
}

class _AkunPageScreenState extends State<AkunPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff2E3D64),
                      Color(0xff0093AC)
                    ]),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    )
                  ]),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('images/asyam.jpg'),
                      ),
                      SizedBox(height: 15,),
                      Text(
                        'Rizky Asyam',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Calon BUMN',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                'Saved Courses',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ProductCard(
                imageURL: "images/gambarpaket.png",
                name: "Paket Try Out BUMN",
                description: "TKD, Ujian Simulasi, Tes Logika, Paket Soal Lengkap",
                price: "Rp50.000,00",),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Image.asset(
                    'images/icons_akun1.png',
                    height: 30,
                    width: 30,),
                  SizedBox(width: 20,),
                  Text(
                    'Edit Profil',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Image.asset(
                    'images/icons_akun2.png',
                    height: 30,
                    width: 30,),
                  SizedBox(width: 20,),
                  Text(
                    'Payment',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Image.asset(
                    'images/icons_akun3.png',
                    height: 30,
                    width: 30,),
                  SizedBox(width: 20,),
                  Text(
                    'Privacy Policy',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Image.asset(
                    'images/icons_akun4.png',
                    height: 30,
                    width: 30,),
                  SizedBox(width: 20,),
                  Text(
                    'Pusat Bantuan',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Image.asset(
                    'images/icons_akun5.png',
                    height: 30,
                    width: 30,),
                  SizedBox(width: 20,),
                  Text(
                    'Logout',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.red
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
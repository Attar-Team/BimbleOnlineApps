
import 'package:bumn_muda/screens/Home/paket_screen.dart';
import 'package:bumn_muda/screens/Home/pembelianpage_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:lottie/lottie.dart';

import '../../data/histori_pemesanan.dart';
import '../../data/paket.dart';
import '../../data/paket_terbeli.dart';
import '../../data/response/histori_pemesanan_response.dart';
import '../../data/response/login_response.dart';
import '../../data/response/paket_response.dart';
import '../../data/response/paket_terbeli_response.dart';
import '../../data/user.dart';
import 'akunpage_screen.dart';
import 'homepage_screen.dart';

class HomeScreen extends StatefulWidget {
  final UserData user;

  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      HomePageScreen(),
      PaketScreen(),
      PembelianPageScreen(),
      AkunPageScreen(),
    ];

    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
            child: GNav(
              backgroundColor: Colors.transparent,
              color: Colors.black,
              activeColor: Colors.white,
              tabBackgroundColor: Color(0xff2E3D64),
              padding: EdgeInsets.all(16),
              gap: 8,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                  textStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  onPressed: () => _onItemTapped(0),
                ),
                GButton(
                  icon: LineIcons.book,
                  text: 'Paket',
                  textStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  onPressed: () => _onItemTapped(1),
                ),
                GButton(
                  icon: LineIcons.shoppingCart,
                  text: 'Pembelian',
                  textStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  onPressed: () => _onItemTapped(2),
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Akun',
                  textStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  onPressed: () => _onItemTapped(3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


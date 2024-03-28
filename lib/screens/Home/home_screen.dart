
import 'package:bumn_muda/screens/Home/paket_screen.dart';
import 'package:bumn_muda/screens/Home/pembelianpage_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import 'akunpage_screen.dart';
import 'homepage_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePageScreen(),
    PaketScreen(),
    PembelianPageScreen(),
    AkunPageScreen(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void onBackPressed() {
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    // Tunggu widget terkait untuk dibuat
    // dan dapatkan akses ke context di dalam didChangeDependencies()
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Akses context dan lakukan inisialisasi Firebase di sini
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('User is currently signed out!'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Signed by ${user.email}'),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: Container(
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft:
                Radius.circular(30.0), // Sudut kiri atas menjadi melengkung
            topRight:
                Radius.circular(30.0), // Sudut kanan atas menjadi melengkung
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3)
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
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
                    color: Colors.white),
                    onPressed: () => _onItemTapped(0),
              ),
              GButton(
                icon: LineIcons.book,
                text: 'Paket',
                textStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
                    onPressed: () => _onItemTapped(1)
              ),
              GButton(
                icon: LineIcons.shoppingCart,
                text: 'Pembelian',
                textStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
                    onPressed: () => _onItemTapped(2)
              ),
              GButton(
                icon: LineIcons.user,
                text: 'Akun',
                textStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
                    onPressed: () => _onItemTapped(3)
              ),
            ],
          ),
        ),
      ),
    );
  }
}

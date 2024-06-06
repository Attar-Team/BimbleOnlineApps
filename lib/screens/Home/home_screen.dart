
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

class _HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<HistoriPemesanan> historiPemesanan = [];
  List<Package> list_packages = [];
  List<PaketTerbeli> paketTerbeli = [];

  late Future<void>? fetchAllDataFuture = null;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      fetchAllDataFuture = fetchAllData();
    });
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
            content: Text('Signed in by ${user.email}'),
          ),
        );
      }
    });
  }

  Future<void> fetchAllData() async {
    showLoadingDialog(context);
    try {
      final packagesResponse = await fetchPackages();
      final historiPemesananResponse = await fetchHistoriPemesanan();
      final paketTerbeliResponse = await fetchPaketTerbeli();

      setState(() {
        list_packages = packagesResponse.data;
        historiPemesanan = historiPemesananResponse.data;
        paketTerbeli = paketTerbeliResponse.data;
      });

      print('list_packages size: ${list_packages.length}');
      print('historiPemesanan size: ${historiPemesanan.length}');
      print('paketTerbeli size: ${paketTerbeli.length}');

      Navigator.of(context).pop(); // Close the loading dialog
    } catch (e) {
      Navigator.of(context).pop(); // Close the loading dialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to fetch data: $e'),
        ),
      );
      throw e;
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
          backgroundColor: Colors.white,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Lottie.asset(
              'assets/animations/book_anim.json',
              width: 200,
              height: 200,
            ),
          ),
        );
      },
    );
  }

  void printError(String error) {
    print('Error: $error');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<void>(
          future: fetchAllDataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              printError(snapshot.error.toString());
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              List<Widget> _widgetOptions = <Widget>[
                HomePageScreen(packages: list_packages),
                PaketScreen(paketTerbeli: paketTerbeli, listPaket: list_packages,),
                PembelianPageScreen(historiPemesanan: historiPemesanan, list_paket: list_packages),
                AkunPageScreen(),
              ];
      
              return IndexedStack(
                index: _selectedIndex,
                children: _widgetOptions,
              );
            }
          },
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
              )
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


import 'package:flutter/material.dart';

class PembelianPageScreen extends StatefulWidget {
  const PembelianPageScreen({super.key});

  @override
  State<PembelianPageScreen> createState() => _PembelianPageScreenState();
}

class _PembelianPageScreenState extends State<PembelianPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.blue),
        child: Text(
          'Halaman Pembelian'
        ),
      ),
    );
  }
}
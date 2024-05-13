import 'package:flutter/material.dart';

class UnduhPDF{
  final String namaFile;
  final int halaman;

  UnduhPDF({
    required this.namaFile,
    required this.halaman
  });
}

final List<UnduhPDF>products = [
  UnduhPDF(
    namaFile: 'Paket Soal PDF Lengkap 2023', 
    halaman: 243
  ),
  UnduhPDF(
    namaFile: 'Paket Soal PDF Lengkap 2022', 
    halaman: 210
  ),
];
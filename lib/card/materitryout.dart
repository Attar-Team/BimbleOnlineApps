import 'package:flutter/material.dart';

class MateriTryOut{
  final String judulTryOut;
  final int jumlahSoal;
  final int progress;

  MateriTryOut({
    required this.judulTryOut,
    required this.jumlahSoal,
    required this.progress
  });
}
final List<MateriTryOut> products = [
    MateriTryOut(
      judulTryOut: 'Bahasa Inggris', 
      jumlahSoal: 20, 
      progress: 60
    ),
    MateriTryOut(
      judulTryOut: 'Matematika', 
      jumlahSoal: 30, 
      progress: 40
    ),
    MateriTryOut(
      judulTryOut: 'Kimia', 
      jumlahSoal: 40, 
      progress: 70
    ),
    MateriTryOut(
      judulTryOut: 'Biologi', 
      jumlahSoal: 50, 
      progress: 50
    ),
  ];
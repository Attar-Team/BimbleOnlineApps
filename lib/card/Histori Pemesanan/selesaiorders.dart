import 'package:flutter/material.dart';

class SelesaiOrders{
  final String judul;
  final String deskripsi;
  final DateTime tanggal;
  final String imageURL;

  SelesaiOrders({
    required this.judul,
    required this.deskripsi,
    required this.tanggal,
    required this.imageURL
  });
}

final List<SelesaiOrders> products = [
  SelesaiOrders(
    judul: 'Paket BUMN 1', 
    deskripsi: 'Deskripsi ...........', 
    tanggal: DateTime(2024, 9, 1), 
    imageURL: 'images/gambarpaket.png'
  ),
  SelesaiOrders(
    judul: 'Paket BUMN 2', 
    deskripsi: 'Deskripsi ...........', 
    tanggal: DateTime(2024, 9, 1), 
    imageURL: 'images/gambarpaket.png'
  ),
  SelesaiOrders(
    judul: 'Paket BUMN 3', 
    deskripsi: 'Deskripsi ...........', 
    tanggal: DateTime(2024, 9, 1), 
    imageURL: 'images/gambarpaket.png'
  ),
];
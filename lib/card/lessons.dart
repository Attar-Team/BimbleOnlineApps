import 'package:flutter/material.dart';

class Lessons{
  final String nomer;
  final String judul;
  final String waktu;

  Lessons({
    required this.nomer,
    required this.judul,
    required this.waktu
  });
}

final List<Lessons> products = [
  Lessons(
    nomer: '01', 
    judul: 'Yang Perlu Disiapkan', 
    waktu: '10 Mins'
  ),
  Lessons(
    nomer: '02', 
    judul: 'Lorem Ipsum', 
    waktu: '5 Mins'
  ),
  Lessons(
    nomer: '03', 
    judul: 'Lorem Ipsum', 
    waktu: '15 Mins'
  ),
  Lessons(
    nomer: '04', 
    judul: 'Lorem Ipsum', 
    waktu: '18 Mins'
  ),
    Lessons(
    nomer: '05', 
    judul: 'Lorem Ipsum', 
    waktu: '18 Mins'
  ),
    Lessons(
    nomer: '06', 
    judul: 'Lorem Ipsum', 
    waktu: '18 Mins'
  ),
    Lessons(
    nomer: '07', 
    judul: 'Lorem Ipsum', 
    waktu: '18 Mins'
  ),
];
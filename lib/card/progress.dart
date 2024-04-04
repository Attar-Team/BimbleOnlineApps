import 'package:flutter/material.dart';

class Progress{
  final String imageURL;
  final String judul;
  final String progress;

  Progress({
    required this.imageURL,
    required this.judul,
    required this.progress
  });
}

final List<Progress> products = [
  Progress(
    imageURL: 'images/gambarpaket.png', 
    judul: 'Video Pembelajaran',
    progress: '70%'
  ),
  Progress(
    imageURL: 'images/gambarpaket.png', 
    judul: 'Try Out / Latihan Soal',
    progress: '70%'
  ),
  Progress(
    imageURL: 'images/gambarpaket.png', 
    judul: 'Core Value BUMN',
    progress: '70%'
  ),
];
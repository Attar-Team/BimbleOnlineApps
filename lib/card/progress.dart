import 'package:flutter/material.dart';

class Progress{
  final String imageURL;
  final String judul;
  final String progress;
  final double percent;

  Progress({
    required this.imageURL,
    required this.judul,
    required this.progress,
    required this.percent
  });
}

final List<Progress> products = [
  Progress(
    imageURL: 'images/gambarpaket.png', 
    judul: 'Video Pembelajaran',
    progress: '70%',
    percent: 0.7
  ),
  Progress(
    imageURL: 'images/gambarpaket.png', 
    judul: 'Try Out / Latihan Soal',
    progress: '50%',
    percent: 0.5
  ),
  Progress(
    imageURL: 'images/gambarpaket.png', 
    judul: 'Core Value BUMN',
    progress: '30%',
    percent: 0.3
  ),
  Progress(
    imageURL: 'images/gambarpaket.png', 
    judul: 'Free Bank Soal',
    progress: '10%',
    percent: 0.1
  ),
];
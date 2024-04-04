import 'package:flutter/material.dart';

class Paketku{
  final String imageURL;
  final String title;
  final String description;
  final String progress;

  Paketku({
    required this.imageURL,
    required this.title,
    required this.description,
    required this.progress,
  });
}

final List<Paketku> products = [
      Paketku(
        imageURL: "images/gambarpaket.png",
        title: "Nama Produk 1",
        description: "Deskripsi Produk 1",
        progress: "80%",
      ),
      Paketku(
        imageURL: "images/gambarpaket.png",
        title: "Nama Produk 2",
        description: "Deskripsi Produk 2",
        progress: "40%",
      ),
      Paketku(
        imageURL: "images/gambarpaket.png",
        title: "Nama Produk 3",
        description: "Deskripsi Produk 3",
        progress: "50%",
      ),
      Paketku(
      imageURL: "images/gambarpaket.png",
        title: "Nama Produk 4",
        description: "Deskripsi Produk 4",
        progress: "20%",
      ),
      Paketku(
        imageURL: "images/gambarpaket.png",
        title: "Nama Produk 5",
        description: "Deskripsi Produk 5",
        progress: "70%",
      ),
    ];
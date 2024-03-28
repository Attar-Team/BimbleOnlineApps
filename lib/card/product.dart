import 'package:flutter/material.dart';

class Product{
  final String imageURL;
  final String title;
  final String description;
  final String price;

  Product({
    required this.imageURL,
    required this.title,
    required this.description,
    required this.price,
  });
}

final List<Product> products = [
      Product(
        imageURL: "images/gambarpaket.png",
        title: "Nama Produk 1",
        description: "Deskripsi Produk 1",
        price: "Rp 100.000",
      ),
      Product(
        imageURL: "images/gambarpaket.png",
        title: "Nama Produk 2",
        description: "Deskripsi Produk 2",
        price: "Rp 200.000",
      ),
      Product(
        imageURL: "images/gambarpaket.png",
        title: "Nama Produk 3",
        description: "Deskripsi Produk 3",
        price: "Rp 300.000",
      ),
    ];
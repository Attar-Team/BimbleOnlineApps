import 'package:flutter/material.dart';

class Product{
  final String imageURL;
  final String title;
  final String description;
  final int price;

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
        price: 100000,
      ),
      Product(
        imageURL: "images/gambarpaket.png",
        title: "Nama Produk 2",
        description: "Deskripsi Produk 2",
        price: 200000,
      ),
      Product(
        imageURL: "images/gambarpaket.png",
        title: "Nama Produk 3",
        description: "Deskripsi Produk 3",
        price: 300000,
      ),
      Product(
        imageURL: "images/gambarpaket.png",
        title: "Nama Produk 4",
        description: "Deskripsi Produk 4",
        price: 400000,
      ),
      Product(
        imageURL: "images/gambarpaket.png",
        title: "Nama Produk 5",
        description: "Deskripsi Produk 5",
        price: 500000,
      ),
    ];
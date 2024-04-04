import 'package:bumn_muda/card/product.dart';
import 'package:bumn_muda/card/product_card.dart';
import 'package:bumn_muda/screens/Paket/detail_paket.dart';
import 'package:flutter/material.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  bool? jenisCheckbox1 = false;
  bool? jenisCheckbox2 = false;
  bool kategoriCheckbox1 = false;
  bool kategoriCheckbox2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Image.asset(
          'images/logoapps.png', // Ganti dengan path gambar Anda
          width: 150, // Sesuaikan ukuran gambar
          height: 50, // Sesuaikan ukuran gambar
        ),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pembelian Paket',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 3),
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                child: const Text(
                                  'Jenis',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: jenisCheckbox1 ?? false,
                                    onChanged: (bool? newValue) {
                                      if (newValue != null) {
                                        setState(() {
                                          jenisCheckbox1 = newValue;
                                          if (newValue == true) {
                                            jenisCheckbox2 = false;
                                          }
                                        });
                                      }
                                    },
                                    activeColor: Color(0xff2E3D64),
                                  ),
                                  Text(
                                    'BUMN',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        fontSize: 10),
                                  ),
                                  Checkbox(
                                    value: jenisCheckbox2 ?? false,
                                    onChanged: (bool? newValue) {
                                      if (newValue != null) {
                                        setState(() {
                                          jenisCheckbox2 = newValue;
                                          if (newValue == true) {
                                            jenisCheckbox1 = false;
                                          }
                                        });
                                      }
                                    },
                                    activeColor: Color(0xff2E3D64),
                                  ),
                                  Text(
                                    'CPNS',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        fontSize: 10),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                child: const Text(
                                  'Kategori',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: kategoriCheckbox1 ?? false,
                                    onChanged: (bool? newValue) {
                                      if (newValue != null) {
                                        setState(() {
                                          kategoriCheckbox1 = newValue;
                                          if (newValue == true) {
                                            kategoriCheckbox2 = false;
                                          }
                                        });
                                      }
                                    },
                                    activeColor: Color(0xff2E3D64),
                                  ),
                                  Text(
                                    'Try Out',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        fontSize: 10),
                                  ),
                                  Checkbox(
                                    value: kategoriCheckbox2 ?? false,
                                    onChanged: (bool? newValue) {
                                      if (newValue != null) {
                                        setState(() {
                                          kategoriCheckbox2 = newValue;
                                          if (newValue == true) {
                                            kategoriCheckbox1 = false;
                                          }
                                        });
                                      }
                                    },
                                    activeColor: Color(0xff2E3D64),
                                  ),
                                  Text(
                                    'Course',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        fontSize: 10),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 570, // Atur tinggi sesuai kebutuhan Anda
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount:
                      (products.length / 2).ceil(), // Menentukan jumlah baris
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                // Implementasi tindakan ketika item diklik di sini
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPaket(productName: products[index * 2].title,),
                                  ),
                                );
                              },
                              child: ProductCard(
                                imageURL: products[index * 2].imageURL,
                                name: products[index * 2].title,
                                description: products[index * 2].description,
                                price: products[index * 2].price,
                              ),
                            ),
                          ),
                        ),
                        if ((index * 2 + 1) < products.length)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  // Implementasi tindakan ketika item diklik di sini
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailPaket(productName: products[index * 2 + 1].title,),
                                    ),
                                  );
                                },
                                child: ProductCard(
                                  imageURL: products[index * 2 + 1].imageURL,
                                  name: products[index * 2 + 1].title,
                                  description:
                                      products[index * 2 + 1].description,
                                  price: products[index * 2 + 1].price,
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

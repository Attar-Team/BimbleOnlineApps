import 'package:bumn_muda/card/product.dart';
import 'package:bumn_muda/card/product_card.dart';
import 'package:bumn_muda/data/paket.dart';
import 'package:bumn_muda/data/response/paket_response.dart';
import 'package:bumn_muda/screens/Paket/detail_paket.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';


import 'package:http/http.dart' as http;
import 'dart:convert';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  late Future<ApiResponse> futureApiResponse;
  List<Package> packages = [];

  @override
  void initState() {
    super.initState();
    // Menunda eksekusi fetchPackages hingga frame pertama selesai dirender
    SchedulerBinding.instance.addPostFrameCallback((_) {
      fetchPackages(context).then((apiResponse) {
        setState(() {
          packages = apiResponse.data;
        });
      }).catchError((error) {
        // Tangani kesalahan jika perlu
        print('Error fetching packages: $error');
      });
    });
  }

  Future<ApiResponse> fetchPackages(BuildContext context) async {
    showLoadingDialog(context);
    try {
      final response = await http
          .get(Uri.parse('http://bimbel.adzazarif.my.id/api/package'));

      if (response.statusCode == 200) {
        Navigator.of(context).pop(); // Close the loading dialog
        return ApiResponse.fromJson(json.decode(response.body));
      } else {
        Navigator.of(context).pop(); // Close the loading dialog
        throw Exception('Failed to load packages');
      }
    } catch (e) {
      Navigator.of(context).pop(); // Close the loading dialog
      throw e; // Rethrow the exception
    }
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Lottie.asset(
              'assets/animations/book_anim.json',
              width: 200,
              height: 200
            ),
          ),
        );
      },
    );
  }

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
                height: 570, // Sesuaikan tinggi sesuai kebutuhan
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount:
                      (packages.length / 2).ceil(), // Menentukan jumlah baris
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPaket(
                                      productName: packages[index * 2].name,
                                      productType: packages[index * 2].type,
                                      productDesc:
                                          packages[index * 2].description,
                                      listExam: packages[index * 2].listPackage,
                                      price: int.parse(packages[index * 2].price),
                                      discount: int.parse(packages[index * 2].discount),
                                      imageURL: packages[index * 2].photo,
                                    ),
                                  ),
                                );
                              },
                              child: ProductCard(
                                imageURL:
                                    'http://bimbel.adzazarif.my.id/${packages[index * 2].photo}',
                                name: packages[index * 2].name,
                                description: packages[index * 2].description,
                                price: int.parse(packages[index * 2].price),
                                discount: int.parse(packages[index * 2].discount),
                              ),
                            ),
                          ),
                        ),
                        if ((index * 2 + 1) < packages.length)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailPaket(
                                        productName:
                                            packages[index * 2 + 1].name,
                                        productType:
                                            packages[index * 2 + 1].type,
                                        productDesc:
                                            packages[index * 2 + 1].description,
                                        listExam:
                                            packages[index * 2 + 1].listPackage,
                                        price: 
                                            int.parse(packages[index * 2 + 1].price),
                                        discount: 
                                            int.parse(packages[index * 2 + 1]. discount),
                                        imageURL: 
                                            packages[index * 2 + 1].photo,
                                      ),
                                    ),
                                  );
                                },
                                child: ProductCard(
                                  imageURL:
                                      'http://bimbel.adzazarif.my.id/${packages[index * 2 + 1].photo}',
                                  name: packages[index * 2 + 1].name,
                                  description:
                                      packages[index * 2 + 1].description,
                                  price:
                                      int.parse(packages[index * 2 + 1].price),
                                  discount: 
                                      int.parse(packages[index * 2 + 1].discount),
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

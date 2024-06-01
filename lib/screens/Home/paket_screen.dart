import 'package:bumn_muda/screens/Paketku/detail_paketku.dart';
import 'package:flutter/material.dart';
import 'package:bumn_muda/card/paketku_card.dart';
import 'package:bumn_muda/card/paketku.dart';
import 'package:flutter/scheduler.dart';
import '../../data/paket_terbeli.dart';
import '../../data/response/paket_terbeli_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:lottie/lottie.dart';

class PaketScreen extends StatefulWidget {
  const PaketScreen({super.key});

  @override
  State<PaketScreen> createState() => _PaketScreenState();
}

class _PaketScreenState extends State<PaketScreen> {

  List<PaketTerbeli> paketTerbeli = [];

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      fetchPaketTerbeli(context).then((apiResponse) {
        setState(() {
          paketTerbeli = apiResponse.data;
          for (var paket in paketTerbeli) {
            print(paket.toJson());
          }
        });
      }).catchError((error) {
        // Tangani kesalahan jika perlu
        print('Error fetching paket terbeli: $error');
      });
    });
  }

  Future<PaketTerbeliResponse> fetchPaketTerbeli(BuildContext context) async {
    showLoadingDialog(context);
    try {
      final response = await http.get(Uri.parse('http://bimbel.adzazarif.my.id/api/purchased-package/1'));

      if (response.statusCode == 200) {
        Navigator.of(context).pop();
        return PaketTerbeliResponse.fromJson(json.decode(response.body));
      } else {
        Navigator.of(context).pop();
        throw Exception('Failed to load paket terbeli : ${response.body}');
      }
    } catch (e) {
      Navigator.of(context).pop();
      throw e;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage('images/logoapps.png'),
                      width: 150,
                      height: 50,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Paketku',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      'Berikut paket - paket course atau try out yang telah kamu beli ...',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ],
                ),
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
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPaketku(productName: products[index * 2].title,),
                                  ),
                                );
                              },
                              child: PaketkuCard(
                                imageURL: products[index * 2].imageURL,
                                name: products[index * 2].title,
                                description: products[index * 2].description,
                                progress: products[index * 2].progress,
                              ),
                            ),
                          ),
                        ),
                        if ((index * 2 + 1) < products.length)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPaketku(productName: products[index * 2 + 1].title),
                                  ),
                                );
                                },
                                child: PaketkuCard(
                                  imageURL: products[index * 2 + 1].imageURL,
                                  name: products[index * 2 + 1].title,
                                  description: products[index * 2 + 1].description,
                                  progress: products[index * 2 + 1].progress,
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

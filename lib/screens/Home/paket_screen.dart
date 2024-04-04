import 'package:flutter/material.dart';
import 'package:bumn_muda/card/paketku_card.dart';
import 'package:bumn_muda/card/paketku.dart';

class PaketScreen extends StatefulWidget {
  const PaketScreen({super.key});

  @override
  State<PaketScreen> createState() => _PaketScreenState();
}

class _PaketScreenState extends State<PaketScreen> {
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
                            child: PaketkuCard(
                              imageURL: products[index * 2].imageURL,
                              name: products[index * 2].title,
                              description: products[index * 2].description,
                              progress: products[index * 2].progress,
                            ),
                          ),
                        ),
                        if ((index * 2 + 1) < products.length)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: PaketkuCard(
                                imageURL: products[index * 2 + 1].imageURL,
                                name: products[index * 2 + 1].title,
                                description: products[index * 2 + 1].description,
                                progress: products[index * 2 + 1].progress,
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

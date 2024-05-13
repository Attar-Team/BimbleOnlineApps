import 'package:bumn_muda/card/Histori%20Pemesanan/selesaiorders.dart';
import 'package:bumn_muda/card/Histori%20Pemesanan/selesaiorders_card.dart';
import 'package:flutter/material.dart';

class SelesaiScreen extends StatefulWidget {
  const SelesaiScreen({super.key});

  @override
  State<SelesaiScreen> createState() => _SelesaiScreenState();
}

class _SelesaiScreenState extends State<SelesaiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return SelesaiOrdersCard(
                      judul: products[index].judul,
                      deskripsi: products[index].deskripsi,
                      tanggal: products[index].tanggal,
                      imageURL: products[index].imageURL,
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
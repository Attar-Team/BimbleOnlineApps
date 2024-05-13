import 'package:bumn_muda/card/Histori%20Pemesanan/activeorders.dart';
import 'package:bumn_muda/card/Histori%20Pemesanan/activeorders_card.dart';
import 'package:flutter/material.dart';

class ActiveOrders_Screen extends StatefulWidget {
  const ActiveOrders_Screen({super.key});

  @override
  State<ActiveOrders_Screen> createState() => _ActiveOrdersState();
}

class _ActiveOrdersState extends State<ActiveOrders_Screen> {
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
                    return ActiveOrdersCard(
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
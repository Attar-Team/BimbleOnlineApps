import 'package:bumn_muda/card/Histori%20Pemesanan/selesaiorders.dart';
import 'package:bumn_muda/card/Histori%20Pemesanan/selesaiorders_card.dart';
import 'package:flutter/material.dart';

import '../../data/histori_pemesanan.dart';
import '../../data/paket.dart';

class SelesaiScreen extends StatefulWidget {
  final List<HistoriPemesanan> data;
  final List<Package> dataPaket;

  const SelesaiScreen({Key? key, required this.data, required this.dataPaket}) : super(key: key);

  @override
  State<SelesaiScreen> createState() => _SelesaiScreenState();
}

class _SelesaiScreenState extends State<SelesaiScreen> {


  @override
  void initState() {
    super.initState();
    print("Selesai Orders : ${widget.data.length}");
    print("Packages : ${widget.dataPaket.length}");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: const Text(
                  '*Anda sudah menyelesaikan paketnya, anda dapat download sertifikat nya',
                  style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff2E3D64)
                  ),
                ),
              ),
              SizedBox(height: 10,),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.data.length,
                itemBuilder: (context, index) {
                  return SelesaiOrdersCard(
                    judul: "",
                    deskripsi: "",
                    tanggal: widget.data[index].date,
                    imageURL: "",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
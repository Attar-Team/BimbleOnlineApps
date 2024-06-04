import 'package:bumn_muda/card/Histori%20Pemesanan/activeorders.dart';
import 'package:bumn_muda/card/Histori%20Pemesanan/activeorders_card.dart';
import 'package:bumn_muda/data/histori_pemesanan.dart';
import 'package:bumn_muda/data/paket.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ActiveOrdersScreen extends StatefulWidget {
  final List<HistoriPemesanan> data;
  final List<Package> dataPaket;

  const ActiveOrdersScreen({Key? key, required this.data, required this.dataPaket}) : super(key: key);

  @override
  State<ActiveOrdersScreen> createState() => _ActiveOrdersScreenState();
}

class _ActiveOrdersScreenState extends State<ActiveOrdersScreen> {

  @override
  void initState() {
    super.initState();
    print("Active Orders : ${widget.data.length}");
    print("Packages : ${widget.dataPaket.length}");
    print("Package ID 1 : ${widget.dataPaket.where((element) => element.id == 1).toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  '*Berikut paket yang masih kamu belum kerjakan, selesaikan pekerjaanmu dan dapatkan sertifikatnya',
                  style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff2E3D64),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.data.length,
                itemBuilder: (context, index) {
                  return ActiveOrdersCard(
                    judul: widget.dataPaket.where((element) => element.id.toString() == widget.data[index].packageId).first.name,
                    deskripsi: widget.dataPaket.where((element) => element.id.toString() == widget.data[index].packageId).first.description,
                    tanggal: DateTime.tryParse(widget.data[index].createdAt),
                    imageURL: "http://bimbel.adzazarif.my.id/storage/${
                      widget.dataPaket
                          .where((element) =>
                              element.id.toString() ==
                              widget.data[index].packageId)
                          .first
                          .photo
                    }",
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


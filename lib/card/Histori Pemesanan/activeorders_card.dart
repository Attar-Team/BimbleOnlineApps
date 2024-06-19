import 'package:bumn_muda/screens/Histori%20Pemesanan/detailorders_screen.dart';
import 'package:bumn_muda/screens/Paketku/detail_paketku.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../data/histori_pemesanan.dart';
import '../../data/paket.dart';

class ActiveOrdersCard extends StatelessWidget {
  final String judul;
  final String deskripsi;
  final DateTime? tanggal;
  final String imageURL;
  final List<Package> list_paket;
  final HistoriPemesanan history;

  ActiveOrdersCard(
      {required this.judul,
      required this.deskripsi,
      required this.tanggal,
      required this.imageURL,
      required this.list_paket,
        required this.history});

  @override
  Widget build(BuildContext context) {
    String judul;
    if (history.packageIds.length == 1) {
      judul = '${list_paket.where((element) => element.id.toString() == history.packageIds[0]).first.name}';
    } else {
      judul = '${list_paket.where((element) => element.id.toString() == history.packageIds[0]).first.name} dan ${history.packageIds.length - 1} paket lainnya';
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    'https://bimbel.adzazarif.my.id/storage/${list_paket.where((element) => element.id.toString() == history.packageIds[0]).first.photo}', // Ubah dengan URL gambar yang sesuai
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey,
                        child: const Center(
                          child: Text('Error loading image'),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              ConstrainedBox(
              constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.6, // Atur lebar sesuai kebutuhan
              ),
      child: Text(
        judul,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xff2E3D64),
        ),
      ),
    ),

    const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Dibeli pada ' + _formatDate(history.date),
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 11,
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => DetailOrders(histori: history, list_package: list_paket)));
                        },
                        child: Container(
                          padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff2E3D64),
                              border: Border.all(
                                  width: 2, color: Color(0xff2E3D64))),
                          child: const Text(
                            'Detail Order',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );;
  }

  String _formatDate(DateTime date) {
    String day = date.day.toString();
    String month = '';
    switch (date.month) {
      case 1:
        month = 'Januari';
        break;
      case 2:
        month = 'Februari';
        break;
      case 3:
        month = 'Maret';
        break;
      case 4:
        month = 'April';
        break;
      case 5:
        month = 'Mei';
        break;
      case 6:
        month = 'Juni';
        break;
      case 7:
        month = 'Juli';
        break;
      case 8:
        month = 'Agustus';
        break;
      case 9:
        month = 'September';
        break;
      case 10:
        month = 'Oktober';
        break;
      case 11:
        month = 'November';
        break;
      case 12:
        month = 'Desember';
        break;
      default:
        month = '';
    }
    String year = date.year.toString();
    return '$day $month $year';
  }
}

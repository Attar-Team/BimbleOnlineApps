import 'package:bumn_muda/screens/Paketku/detailtryout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../data/ujian.dart';

class MateriTryOutCard extends StatelessWidget {
  final String judulTryOut;
  final int jumlahSoal;
  final int progress;
  final String waktu;
  final Exam exam;

  MateriTryOutCard(
      {required this.judulTryOut,
      required this.jumlahSoal,
      required this.progress,
        required this.waktu, required this.exam});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 60, left: 10, top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xff2E3D64).withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            judulTryOut,
            style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
          Row(
            children: [
              const Text(
                'Soal : ',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                    color: Colors.black),
              ),
              Text(
                jumlahSoal.toString(),
                style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                    color: Colors.black),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailTryOut(judulTryOut: judulTryOut, waktuTryout: waktu, soal: jumlahSoal, dataExam: exam ,)
                    )
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Color(0xff2E3D64),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Kerjakan >',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(0xff2E3D64),
                    width: 2,
                  )),
              child: const Text(
                'Lihat Nilai >',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Color(0xff2E3D64)),
              ),
            ),
          ])
        ],
      ),
    );
  }
}

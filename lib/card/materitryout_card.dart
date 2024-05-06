import 'package:bumn_muda/screens/Paketku/detailtryout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MateriTryOutCard extends StatelessWidget {
  final String judulTryOut;
  final int jumlahSoal;
  final int progress;

  MateriTryOutCard(
      {required this.judulTryOut,
      required this.jumlahSoal,
      required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
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
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                Row(
                  children: [
                    Text(
                      'Soal : ',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                          color: Colors.black),
                    ),
                    Text(
                      jumlahSoal.toString(),
                      style: TextStyle(
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
                    onTap: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => DetailTryOut(judulTryOut: judulTryOut)));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: Color(0xff2E3D64),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Kerjakan >',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
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
                    child: Text(
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
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            decoration: BoxDecoration(
              color: Color(0xff2E3D64),
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
              children: [
                Text(
                  'Progress',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  progress.toString() + '%',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

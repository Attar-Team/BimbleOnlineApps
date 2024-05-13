import 'package:flutter/material.dart';

class UnduhPDFCard extends StatelessWidget {
  final String namaFile;
  final int halaman;

  UnduhPDFCard({
    required this.namaFile,
    required this.halaman
  });

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xffE7F0FD),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.picture_as_pdf,
              color: Colors.red,
              size: 25,),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    namaFile,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                    ),
                  ),
                  Text(
                    '$halaman Halaman',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                    ),
                  ),
                  Text(
                    '23 MB',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                    ),
                  ),
                ],
              ),
            ],
          ),
          Icon(Icons.download_for_offline_sharp,
          color: Color(0xff2E3D64),
          size: 25,)
        ],
      ),
    );
  }
}
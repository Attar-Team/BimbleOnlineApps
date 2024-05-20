import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SertifikatScreen extends StatefulWidget {
  final String judulPaket;
  const SertifikatScreen({required this.judulPaket});

  @override
  State<SertifikatScreen> createState() => _SertifikatScreenState();
}

class _SertifikatScreenState extends State<SertifikatScreen> {
  final String namaPDF = 'Sertifikat Paket BUMN 1 Muhammad Rizky Asyam Haidar';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: RichText(
          text: const TextSpan(
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xff2E3D64),
            ),
            children: [
              TextSpan(
                text: 'Sertifikat ',
                style: TextStyle(
                  // Gaya teks untuk "Video"
                  fontWeight: FontWeight.w500,
                  // Atur gaya teks sesuai keinginan Anda
                ),
              ),
              TextSpan(
                text: 'Paket',
                // Gaya teks untuk "Pembelajaran"
              ),
            ],
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.judulPaket,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff2E3D64),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: Color(0xffE7F0FD),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                'Download Sertifikat',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff2E3D64),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
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
                      Icon(
                        Icons.picture_as_pdf,
                        color: Colors.red,
                        size: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              namaPDF,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(
                    Icons.download_for_offline_sharp,
                    color: Color(0xff2E3D64),
                    size: 25,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:bumn_muda/card/progress.dart';
import 'package:bumn_muda/card/progress_card.dart';
import 'package:flutter/material.dart';

class DetailPaketku extends StatefulWidget {
  final String productName;
  const DetailPaketku({Key? key, required this.productName});

  @override
  State<DetailPaketku> createState() => _DetailPaketkuState();
}

class _DetailPaketkuState extends State<DetailPaketku> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Image.asset(
          'images/logoapps.png', // Ganti dengan path gambar Anda
          width: 150, // Sesuaikan ukuran gambar
          height: 50, // Sesuaikan ukuran gambar
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Text(
              widget.productName,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff2E3D64)
              ),
            ),
            SizedBox(height: 5,),
            Text(
              'Ayo segera pelajari apa aja sih yang dipersiapkan agar bisa jadi BUMN MUDA',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey
              ),
            ),
            SizedBox(height: 25,),
            Text(
              'Materi',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff2E3D64)
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -30.0, 0.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ProgressCard(
                      imageURL: products[index].imageURL,
                      judul: products[index].judul,
                      progress: products[index].progress,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
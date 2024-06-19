import 'package:bumn_muda/card/progress.dart';
import 'package:bumn_muda/card/progress_card.dart';
import 'package:bumn_muda/screens/Paketku/corevalue_screen.dart';
import 'package:bumn_muda/screens/Paketku/freebank_screen.dart';
import 'package:bumn_muda/screens/Paketku/tryout_screen.dart';
import 'package:bumn_muda/screens/Paketku/videopembelajaran.dart';
import 'package:flutter/material.dart';

import '../../data/paket.dart';

class DetailPaketku extends StatefulWidget {
  final String productName;
  final Package dataPaket;
  const DetailPaketku({Key? key, required this.productName, required this.dataPaket});

  @override
  State<DetailPaketku> createState() => _DetailPaketkuState();
}

class _DetailPaketkuState extends State<DetailPaketku> {

  @override
  void initState() {
    super.initState();
    print("Paket ID : ${widget.dataPaket.id}");
    print("Paket Name : ${widget.productName}");
  }

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
      body: SingleChildScrollView(
        child: Container(
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
                  itemCount: widget.dataPaket.exam.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ProgressCard(
                        imageURL: widget.dataPaket.photo,
                        judul: widget.dataPaket.exam[index].name,
                        progress: products[index].progress,
                        percent: products[index].percent,
                        onPressed: (){
                          if (widget.dataPaket.exam[index].jenis == 'exam') {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => TryOutScreen(data: widget.dataPaket.exam[index]),));
                          } else if (widget.dataPaket.exam[index].typeCourse == 'videos'){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VideoPembelajaran(videoId: widget.dataPaket.exam[index].url.toString(), judul: widget.dataPaket.exam[index].name.toString(),),));
                          } else if (widget.dataPaket.exam[index].typeCourse == 'file pdf'){
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => FreeBankScreen(urlPdf: widget.dataPaket.exam[index].url.toString(),)));
                          } else if (products[index].judul == 'Free Bank Soal'){
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => CoreValueScreen()));
                          }
                        },
                      ),
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
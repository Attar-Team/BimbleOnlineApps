import 'package:bumn_muda/screens/Quiz/quiz_screen.dart';
import 'package:flutter/material.dart';

import '../../card/histori_ujian.dart';
import '../../data/ujian.dart';

class DetailTryOut extends StatefulWidget {
  final String judulTryOut;
  final String waktuTryout;
  final int soal;
  final Exam dataExam;

  const DetailTryOut({required this.judulTryOut, required this.waktuTryout, Key? key, required this.soal, required this.dataExam}) : super(key: key);

  @override
  State<DetailTryOut> createState() => _DetailTryOutState();
}

class _DetailTryOutState extends State<DetailTryOut> {
  int sortIndex = 0;
  List<TryOutItem> tryoutItem = [
    TryOutItem(selesai: true, nilai: 80, waktuSelesai: DateTime.now()),
    TryOutItem(selesai: false, nilai: null, waktuSelesai: null),
    TryOutItem(selesai: true, nilai: 90, waktuSelesai: DateTime.now()),

  ];

  @override
  void initState(){
    super.initState();
  }

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
                text: 'Materi ',
                style: TextStyle(
                  // Gaya teks untuk "Video"
                  fontWeight: FontWeight.w500,
                  // Atur gaya teks sesuai keinginan Anda
                ),
              ),
              TextSpan(
                text: 'Try Out',
                // Gaya teks untuk "Pembelajaran"
              ),
            ],
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15)
              ),
              child: const Image(
                image: AssetImage('images/gambarpaket.png')),
            ),
            const SizedBox(height: 10,),
            Text(
              widget.judulTryOut,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),),
            SizedBox(height: 10,),
            Row(
              children: [
                const Icon(
                  Icons.play_lesson,
                  color: Colors.black,
                  size: 18,),
                SizedBox(width: 10,),
                Text(
                  '${widget.soal} Soal',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black
                  ),
                ),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                const Icon(
                  Icons.timer,
                  color: Colors.black,
                  size: 18,),
                SizedBox(width: 10,),
                Text(
                  '${widget.waktuTryout} Menit',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black
                  ),
                ),
              ],
            ),
            SizedBox(height: 5,),
            const Row(
              children: [
                Icon(
                  Icons.type_specimen_sharp,
                  color: Colors.black,
                  size: 18,),
                SizedBox(width: 10,),
                Text(
                  'Pilihan Ganda',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: tryoutItem.length,
                itemBuilder: (context, index) {
                  return HistoryCard(
                    isCompleted: tryoutItem[index].selesai,
                    score: tryoutItem[index].nilai,
                    time: tryoutItem[index].waktuSelesai,
                    duration: widget.waktuTryout,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TryOutItem {
  final bool selesai;
  final int? nilai;
  final DateTime? waktuSelesai;
  
  TryOutItem({required this.selesai, required this.nilai, required this.waktuSelesai});
}
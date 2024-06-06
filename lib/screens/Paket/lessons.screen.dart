import 'package:flutter/material.dart';
import 'package:bumn_muda/card/lessons_card.dart';
import 'package:bumn_muda/card/lessons.dart';

import '../../card/soal_card.dart';
import '../../card/tryout_card.dart';
import '../../card/video_card.dart';
import '../../data/ujian.dart';

class LessonsScreen extends StatefulWidget {

  final List<Exam> listExam;

  const LessonsScreen({Key? key, required this.listExam}) : super(key: key);

  @override
  State<LessonsScreen> createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '18 Lessons',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Color(0xff0093AC),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              'Section 1 - Introduction',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            
            Container(
              transform: Matrix4.translationValues(0.0, -30.0, 0.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.listExam.length,
                itemBuilder: (context, index) {
                  final item = widget.listExam[index];
                  Widget card;

                  if (item.jenis == 'exam') {
                    card = TryoutCard(
                      nomer: "",
                      judul: item.name,
                      waktu: "",
                    );
                  } else {
                    switch (item.typeCourse) {
                      case 'videos    ':
                        card = TryoutCard(
                          nomer: "",
                          judul: item.name,
                          waktu: "",
                        );
                        break;
                      case 'file pdf':
                        card = SoalCard(
                          nomer: "",
                          judul: item.name,
                          waktu: "",
                        );
                        break;
                      default:
                        card = Container(); // Optional: Handle unknown types
                        break;
                    }
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: card,
                  );
                },
              )
            ),
            SizedBox(height: 10),
            Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Color(0xff2E3D64),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    'Daftar Kursus - Rp500.000',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
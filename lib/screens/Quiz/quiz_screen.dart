import 'package:bumn_muda/card/pilgan.dart';
import 'package:bumn_muda/card/pilgan_card.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final String soal =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam laoreet gravida tempor. Sed interdum imperdiet massa. Nulla scelerisque ex neque, a mollis velit rhoncus vel. ';
  final int nomerSoal = 2;  
  String? selectedAnswer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2E3D64),
                    ),
                    children: [
                      TextSpan(
                        text: 'Soal ',
                        style: TextStyle(
                          // Gaya teks untuk "Video"
                          fontWeight: FontWeight.w500,
                          // Atur gaya teks sesuai keinginan Anda
                        ),
                      ),
                      TextSpan(
                        text: 'Simulasi',
                        // Gaya teks untuk "Pembelajaran"
                      ),
                    ],
                  ),
                ),
                Text(
                  '01:21:45',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.red),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Text(
              '$nomerSoal/30',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Color(0xff2E3D64),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xff0093AC),
                  width: 1
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Soal No. $nomerSoal',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    soal,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: PilganCard(
                      answer: products[index].answer,
                      selectedAnswer: selectedAnswer ?? '',
                      onChanged: (value) {
                        setState((){
                          selectedAnswer = value;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    color: Color(0xff2E3D64),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    '< Sebelumnya',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    color: Color(0xff2E3D64),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'Selanjutnya >',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

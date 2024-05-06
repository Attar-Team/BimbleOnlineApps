import 'package:bumn_muda/card/materitryout_card.dart';
import 'package:bumn_muda/card/materitryout.dart';
import 'package:bumn_muda/screens/Paketku/detailtryout_screen.dart';
import 'package:flutter/material.dart';

class TryOutScreen extends StatefulWidget {
  const TryOutScreen({super.key});

  @override
  State<TryOutScreen> createState() => _TryOutScreenState();
}

class _TryOutScreenState extends State<TryOutScreen> {
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
            Text(
              'Pilih materi dibawah ini untuk memulai',
              style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            SizedBox(height: 10,),
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: MateriTryOutCard(
                      judulTryOut: products[index].judulTryOut,
                      jumlahSoal: products[index].jumlahSoal,
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

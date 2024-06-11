import 'dart:convert';

import 'package:bumn_muda/card/materitryout_card.dart';
import 'package:bumn_muda/card/materitryout.dart';
import 'package:bumn_muda/screens/Paketku/detailtryout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import '../../data/pengerjaan_ujian.dart';
import '../../data/response/pengerjaan_ujian_response.dart';
import '../../data/ujian.dart';

class TryOutScreen extends StatefulWidget {
  final Exam data;
  const TryOutScreen({super.key, required this.data});

  @override
  State<TryOutScreen> createState() => _TryOutScreenState();
}

class _TryOutScreenState extends State<TryOutScreen> {

  String waktuUjian = '';
  String jumlahSoal = '';

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      setDataExamAttempts();
    });
    print("Exam ID : ${widget.data.id}");
    print("Exam Name : ${widget.data.name}");
  }

  Future<void> setDataExamAttempts() async {
    try {
      showDialogLoading(context); // Panggil showDialogLoading di sini
      final examAttempts = await fetchExamAttempts(context);
      Navigator.of(context).pop(); // Tutup dialog loading setelah selesai
      setState(() {
        // Tambahkan logika penanganan data examAttempts di sini jika perlu
        waktuUjian = examAttempts.data.duration;
        jumlahSoal = examAttempts.data.amountQuestion;
        print("Waktu : ${waktuUjian}");
        print("Jumlah Soal : ${jumlahSoal}");
      });
    } catch (e) {
      print('Failed to fetch data: $e');
      // Handle error here if needed
    }
  }

  Future<ExamAttemptResponse> fetchExamAttempts(BuildContext context) async {
    try {
      final response = await http.get(Uri.parse('http://bimbel.adzazarif.my.id/api/exam/1')); // Ganti URL API dengan yang benar
      if (response.statusCode == 200) {
        return ExamAttemptResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load exam attempts');
      }
    } catch (e) {
      print('Failed to load exam attempts: $e');
      throw Exception('Failed to load exam attempts: $e');
    }
  }


  void showDialogLoading(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
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
            const Text(
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
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: MateriTryOutCard(
                      judulTryOut: widget.data.name,
                      jumlahSoal: int.tryParse(jumlahSoal) ?? 0,
                      progress: products[index].progress, waktu: waktuUjian, exam: widget.data,
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

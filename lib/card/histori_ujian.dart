import 'dart:convert';

import 'package:bumn_muda/data/soal.dart';
import 'package:bumn_muda/screens/Paketku/tryout_screen.dart';
import 'package:bumn_muda/screens/Quiz/pembahasan_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../data/response/answer_response.dart';
import '../data/response/soal_response.dart';
import 'package:http/http.dart' as http;

import '../screens/Quiz/quiz_screen.dart';

class HistoryCard extends StatefulWidget {
  final bool isCompleted;
  final DateTime? time;
  final int? score;
  final String duration;

  HistoryCard({
    required this.isCompleted,
    this.time,
    this.score, required this.duration,
  });

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {

  @override
  void initState() {
    super.initState();
  }

  Future<void> fetchAndSetState(BuildContext context) async {
    showLoadingDialog(context);
    try {
      final soal = await fetchSoal();
      final answer_id = await fetchAnswerId("1", "1");
      setState(() {
        print("Soal : ${soal.soal.first.question}");
        print("Answer ID : ${answer_id.answer_id}");
      });
      Navigator.of(context).pop(); // Menutup dialog
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => QuizScreen(list_pertanyaan: soal.soal, pilihangandakah: true, waktuPengerjaan: widget.duration,answer_id: answer_id.answer_id)), // Ganti NextPage dengan halaman yang ingin dituju
      );
    } catch (e) {
      print('Failed to fetch data: $e');
      Navigator.of(context).pop(); // Menutup dialog jika terjadi error
    }
  }

  Future<SoalResponse> fetchSoal() async {
    final response = await http.get(Uri.parse('http://bimbel.adzazarif.my.id/api/question/1'));
    if (response.statusCode == 200) {
      print("Soal : ${json.decode(response.body)}");
      return SoalResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<AnswerResponse> fetchAnswerId(String exam_id, String user_id) async {
    var uri = Uri.parse('http://bimbel.adzazarif.my.id/api/answer'); // Ganti dengan URL API Anda

    var request = http.MultipartRequest('POST', uri)
      ..fields['exam_id'] = exam_id
      ..fields['user_id'] = user_id;

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        var responseData = json.decode(responseBody);
        print('Response: $responseData');

        // Mengembalikan objek AnswerResponse
        return AnswerResponse.fromJson(responseData);
      } else {
        print('Failed to post data. Status code: ${response.statusCode}');
        // Mengembalikan objek AnswerResponse dengan status gagal
        return AnswerResponse(status: response.statusCode, message: 'Failed to post data',answer_id: 0);
      }
    } catch (e) {
      print('Error: $e');
      // Mengembalikan objek AnswerResponse dengan status gagal dan pesan error
      return AnswerResponse(status: 500, message: e.toString(),answer_id: 0);
    }
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Lottie.asset(
                'assets/animations/book_anim.json',
                width: 200,
                height: 200
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Segment 1: Status pengerjaan dan waktu
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: widget.isCompleted ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    widget.isCompleted ? 'Selesai' : 'Belum Selesai',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                if (widget.isCompleted && widget.time != null)
                  Text(
                    'Waktu: ${widget.time?.hour.toString().padLeft(2, '0')}:${widget.time?.minute.toString().padLeft(2, '0')}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0,
                    ),
                  ),
              ],
            ),
            // Segment 2: Skor
            if(widget.isCompleted && widget.score != null)
              Column(
                children: [
                  const Text(
                    "Nilai",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 12.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    widget.score != null ? widget.score.toString() : '-',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            // Segment 3: Pembahasan atau Mulai
            ElevatedButton(
              onPressed: () {
                // Lakukan aksi sesuai kebutuhan ketika tombol ditekan
                if (widget.isCompleted) {
                  // Lakukan aksi untuk pembahasan
                  Navigator.push(
                    context,
                      MaterialPageRoute(builder: (context) => ReviewPage(questions: [], userAnswers: {}))
                  );
                } else {
                  fetchAndSetState(context);
                }
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                    return widget.isCompleted ? Colors.green : Colors.indigo;
                  },
                ),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              child: Text(
                widget.isCompleted ? 'Pembahasan' : 'Mulai',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Warna teks tetap putih untuk visibilitas yang baik
                ),
              ),
            )
            ,
          ],
        ),
      ),
    );
  }
}

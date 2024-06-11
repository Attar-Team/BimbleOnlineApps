import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../data/soal.dart';

class QuizScreen extends StatefulWidget {

  final List<Question> list_pertanyaan;
  final bool pilihangandakah;
  final String waktuPengerjaan;
  final int answer_id;

  const QuizScreen({super.key, required this.list_pertanyaan, required this.pilihangandakah, required this.waktuPengerjaan, required this.answer_id});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  int currentQuestionIndex = 0;
  String? selectedAnswer;
  List<Question> questions = [];
  bool isMultipleChoice = true;
  Map<int, String> answers = {};

  @override
  void initState() {
    super.initState();
    questions = widget.list_pertanyaan;
    isMultipleChoice = widget.pilihangandakah;
  }

  Future<void> postAnswer(BuildContext context, String question_detail_id, String question_id, String answer_id, String number_question) async {
    final url = Uri.parse('http://bimbel.adzazarif.my.id/api/quiz/answer');

    final Map<String, String> body = {
      'question_detail_id': question_detail_id,
      'question_id': question_id,
      'answer_id': answer_id,
      'number_question': number_question,
    };

    // Show the loading dialog
    showLoadingDialog(context);

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );

      // Dismiss the loading dialog
      Navigator.of(context).pop();

      if (response.statusCode == 200) {
        print('Response body: ${response.body}');
      } else {
        throw Exception('Failed to post data');
      }
    } catch (e) {
      // Dismiss the loading dialog
      Navigator.of(context).pop();
      // Handle the error (e.g., show a snackbar or dialog)
      print('Error: $e');
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

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = answers[currentQuestionIndex];
        print("Next Question : ${answers}");
      });
    } else {
      // End quiz logic here
    }
  }

  void previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
        selectedAnswer = answers[currentQuestionIndex]  ;
        print("Next Question : ${answers  }");
      });
    } else {
      Navigator.of(context).pop(); // Go back if it's the first question
    }
  }

  void showTimeUpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Waktu Habis'),
          content: Text('Waktu pengerjaan soal telah habis.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                // Lakukan aksi tambahan jika diperlukan
              },
            ),
          ],
        );
      },
    );
  }

  void showAnswerStatusDialog(BuildContext context) {
    // Membuat daftar widget yang menampilkan status jawaban untuk setiap nomor soal
    List<Widget> answerStatusWidgets = [];

    for (int i = 0; i < questions.length; i++) {
      String statusText;
      Color statusColor;

      if (answers.containsKey(i)) {
        // Jika jawaban untuk nomor soal ini sudah ada
        statusText = "Sudah Dijawab";
        statusColor = Colors.green;
      } else {
        // Jika jawaban untuk nomor soal ini belum ada
        statusText = "Belum Dijawab";
        statusColor = Colors.red;
      }

      // Menambahkan widget untuk menampilkan status jawaban
      answerStatusWidgets.add(
        ListTile(
          title: Text("Soal ${i + 1}"),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(
              statusText,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
    }

    // Menampilkan dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Status Jawaban'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: answerStatusWidgets,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

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
                text: 'Soal ',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              TextSpan(text: 'Simulasi'),
            ],
          ),
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
                Text(
                  'Soal ${currentQuestionIndex + 1}/${questions.length}',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Color(0xff2E3D64),
                  ),
                ),
                GestureDetector(
                  onTap: () => showAnswerStatusDialog(context),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Color(0xff0093AC),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      'Cek Jawaban',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                CountdownTimer(initialMinutes: int.parse("1"), onTimerEnd: () { showTimeUpDialog(context); },),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xff0093AC), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Soal No. ${currentQuestionIndex + 1}',
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    currentQuestion.question,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            if (isMultipleChoice)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: currentQuestion.questionDetail.length,
                itemBuilder: (context, index) {
                  final answer = currentQuestion.questionDetail[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xff0093AC), width: 1),
                      ),
                      child: RadioListTile<String>(
                        value: answer.contentAnswer,
                        groupValue: selectedAnswer,
                        onChanged: (value) {
                          setState(() {
                            selectedAnswer = value;
                            answers[currentQuestionIndex] = selectedAnswer.toString();
                            print("Selected Answer : ${selectedAnswer} - ID : ${answer.idContent} - Current Question : ${currentQuestionIndex + 1}");
                            postAnswer(context, answer.idContent.toString(), currentQuestion.questionId.toString(), widget.answer_id.toString(), "${currentQuestionIndex + 1}");
                          });
                        },
                        title: Text(answer.contentAnswer),
                      ),
                    ),
                  );
                },
              )
            else
              TextField(
                onChanged: (value) {
                  setState(() {
                    selectedAnswer = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Tulis jawaban Anda',
                ),
              ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: previousQuestion,
                  child: Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      color: Color(0xff2E3D64),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Text(
                      '< Sebelumnya',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: nextQuestion,
                  child: Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      color: Color(0xff2E3D64),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Text(
                      'Selanjutnya >',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CountdownTimer extends StatefulWidget {
  final int initialMinutes;
  final VoidCallback onTimerEnd;

  CountdownTimer({required this.initialMinutes, required this.onTimerEnd});

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Duration duration;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    duration = Duration(minutes: widget.initialMinutes);
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => setCountdown());
  }

  void setCountdown() {
    setState(() {
      final seconds = duration.inSeconds - 1;
      if (seconds < 0) {
        timer.cancel();
        widget.onTimerEnd();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      formatDuration(duration),
      style: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: Colors.red),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}


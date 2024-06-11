import '../soal.dart';

class SoalResponse {
  final int status;
  final String message;
  final List<Question> soal;

  SoalResponse({
    required this.status,
    required this.message,
    required this.soal,
  });

  factory SoalResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Question> soalList = list.map((i) => Question.fromJson(i)).toList();

    return SoalResponse(
      status: json['status'],
      message: json['message'],
      soal: soalList,
    );
  }
}
import '../pengerjaan_ujian.dart';

class ExamAttemptResponse {
  final int id;
  final String message;
  final ExamAttempt data;

  ExamAttemptResponse({
    required this.id,
    required this.message,
    required this.data,
  });

  factory ExamAttemptResponse.fromJson(Map<String, dynamic> json) {
    return ExamAttemptResponse(
      id: json['id'] ?? 0,
      message: json['message'] ?? '',
      data: ExamAttempt.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}
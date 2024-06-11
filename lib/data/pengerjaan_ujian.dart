class ExamAttempt {
  final int id;
  final String name;
  final String duration;
  final String amountQuestion;
  final String isRandom;
  final DateTime createdAt;
  final DateTime updatedAt;

  ExamAttempt({
    required this.id,
    required this.name,
    required this.duration,
    required this.amountQuestion,
    required this.isRandom,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ExamAttempt.fromJson(Map<String, dynamic> json) {
    return ExamAttempt(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      duration: json['duration'] ?? '',
      amountQuestion: json['amount_question'] ?? '',
      isRandom: json['is_random'] ?? '',
      createdAt: DateTime.parse(json['created_at'] ?? ''),
      updatedAt: DateTime.parse(json['updated_at'] ?? ''),
    );
  }
}

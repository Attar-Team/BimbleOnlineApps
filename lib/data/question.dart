class Question{
  final int id;
  final String exam_id;
  final String question;
  final String review;
  final String photo;
  final DateTime created_at;
  final DateTime updated_at;

  Question({
    required this.id,
    required this.exam_id,
    required this.question,
    required this.review,
    required this.photo,
    required this.created_at,
    required this.updated_at
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      exam_id: json['exam_id'],
      question: json['question'],
      review: json['review'],
      photo: json['photo'],
      created_at: DateTime.parse(json['created_at']),
      updated_at: DateTime.parse(json['updated_at'])
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'exam_id': exam_id,
    'question': question,
    'review': review,
    'photo': photo,
    'created_at': created_at.toIso8601String(),
    'updated_at': updated_at.toIso8601String()
  };
}
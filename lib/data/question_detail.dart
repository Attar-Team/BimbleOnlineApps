class QuestionDetail{
  final int id;
  final String question_id;
  final String content_answer;
  final String photo;
  final String corect_answer;
  final DateTime created_at;
  final DateTime updated_at;

  QuestionDetail({
    required this.id,
    required this.question_id,
    required this.content_answer,
    required this.photo,
    required this.corect_answer,
    required this.created_at,
    required this.updated_at
  });

  factory QuestionDetail.fromJson(Map<String, dynamic> json) {
    return QuestionDetail(
      id: json['id'],
      question_id: json['question_id'],
      content_answer: json['content_answer'],
      photo: json['photo'],
      corect_answer: json['corect_answer'],
      created_at: DateTime.parse(json['created_at']),
      updated_at: DateTime.parse(json['updated_at'])
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'question_id': question_id,
    'content_answer': content_answer,
    'photo': photo,
    'corect_answer': corect_answer,
    'created_at': created_at.toIso8601String(),
    'updated_at': updated_at.toIso8601String()
  };

}
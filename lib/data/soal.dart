class Question {
  final int questionId;
  final String question;
  final List<QuestionDetail> questionDetail;

  Question({
    required this.questionId,
    required this.question,
    required this.questionDetail,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    var list = json['question_detail'] as List;
    List<QuestionDetail> detailList = list.map((i) => QuestionDetail.fromJson(i)).toList();

    return Question(
      questionId: json['question_id'],
      question: json['question'],
      questionDetail: detailList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question_id': questionId,
      'question': question,
      'question_detail': questionDetail.map((e) => e.toJson()).toList(),
    };
  }
}

class QuestionDetail {
  final int idContent;
  final String contentAnswer;

  QuestionDetail({
    required this.idContent,
    required this.contentAnswer,
  });

  factory QuestionDetail.fromJson(Map<String, dynamic> json) {
    return QuestionDetail(
      idContent: json['id_content'],
      contentAnswer: json['content_answer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_content': idContent,
      'content_answer': contentAnswer,
    };
  }
}
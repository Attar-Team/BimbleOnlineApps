class AnswerResponse{
  final int status;
  final String message;
  final int answer_id;

  AnswerResponse({
    required this.status,
    required this.message,
    required this.answer_id,
  });

  factory AnswerResponse.fromJson(Map<String, dynamic> json) {
    return AnswerResponse(
      status: json['status'],
      message: json['message'],
      answer_id: json['answer_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'answer_id': answer_id,
    };
  }
}
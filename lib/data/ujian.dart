class Exam {
  final int id;
  final int idDetail;
  final String jenis;
  final String name;
  final String? typeCourse;
  final String? url;
  final String? isReview;
  final String? amountAcces;

  Exam({
    required this.id,
    required this.idDetail,
    required this.jenis,
    required this.name,
    this.typeCourse,
    this.url,
    this.isReview,
    this.amountAcces,
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
      id: json['id'],
      idDetail: json['id_detail'],
      jenis: json['jenis'],
      name: json['name'],
      typeCourse: json['type_course'],
      url: json['url'],
      isReview: json['is_review'],
      amountAcces: json['amount_acces'],
    );
  }
}
class Exam {
  final int id;
  final int courseId;
  final String name;
  final bool isReview;
  final String amountAccess;

  Exam({
    required this.id,
    required this.courseId,
    required this.name,
    required this.isReview,
    required this.amountAccess,
  });

  @override
  String toString() {
    return 'Exam{id: $id, courseId: $courseId, name: $name, isReview: $isReview, amountAccess: $amountAccess}';
  }

  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
      id: json['id'] ?? 0, // Gunakan nilai default jika null
      courseId: json['id_course'] ?? 0, // Gunakan nilai default jika null
      name: json['name'] ?? '', // Gunakan nilai default jika null
      isReview: json['is_review'] == "1", // Konversi ke boolean seperti sebelumnya
      amountAccess: json['amount_acces'] ?? '', // Gunakan nilai default jika null
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_course': courseId,
      'name': name,
      'is_review': isReview ? "1" : "0", // Mengubah boolean ke string "1" atau "0"
      'amount_acces': amountAccess,
    };
  }
}


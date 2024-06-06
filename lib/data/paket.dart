import 'ujian.dart';


class Package {
  final int id;
  final String name;
  final String type;
  final String category;
  final String price;
  final String discount;
  final String description;
  final String photo;
  final List<Exam> exam;

  Package({
    required this.id,
    required this.name,
    required this.type,
    required this.category,
    required this.price,
    required this.discount,
    required this.description,
    required this.photo,
    required this.exam,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    var list = json['list_package'] as List;
    List<Exam> ExamList = list.map((i) => Exam.fromJson(i)).toList();

    return Package(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      category: json['category'],
      price: json['price'],
      discount: json['discount'],
      description: json['description'],
      photo: json['photo'],
      exam: ExamList,
    );
  }
}
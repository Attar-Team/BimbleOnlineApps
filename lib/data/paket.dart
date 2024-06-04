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
  final List<Exam> listPackage;

  Package({
    required this.id,
    required this.name,
    required this.type,
    required this.category,
    required this.price,
    required this.discount,
    required this.description,
    required this.photo,
    required this.listPackage,
  });

  @override
  String toString() {
    return 'Package{id: $id, name: $name, type: $type, category: $category, price: $price, discount: $discount, description: $description, photo: $photo, listPackage: $listPackage}';
  }

  factory Package.fromJson(Map<String, dynamic> json) {
    var listPackageJson = json['list_package'] as List;
    List<Exam> listPackage = listPackageJson.map((i) => Exam.fromJson(i)).toList();

    return Package(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      category: json['category'],
      price: json['price'],
      discount: json['discount'],
      description: json['description'],
      photo: json['photo'],
      listPackage: listPackage,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'category': category,
      'price': price,
      'discount': discount,
      'description': description,
      'photo': photo,
      'list_package': listPackage.map((e) => e.toJson()).toList(),
    };
  }

}
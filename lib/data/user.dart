class UserData {
  final int id;
  final String? socialId;
  final String name;
  final String email;
  final String image;
  final String phone;
  final DateTime? emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String role;

  UserData({
    required this.id,
    this.socialId,
    required this.name,
    required this.email,
    required this.image,
    required this.phone,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.role,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] as int,
      socialId: json['social_id'] as String? ?? '', // Nilai default jika null
      name: json['name'] as String,
      email: json['email'] as String,
      image: json['image'] as String,
      phone: json['no_telp'] as String? ?? '', // Nilai default jika null
      emailVerifiedAt: json['email_verified_at'] != null ? DateTime.parse(json['email_verified_at'] as String) : null,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'] as String) : DateTime.now(),
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'] as String) : DateTime.now(),
      role: json['role'] as String,
    );
  }


  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'social_id': socialId,
      'name': name,
      'email': email,
      'image': image,
      'no_telp': phone,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'role': role,
    };
  }
}

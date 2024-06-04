class Login{
  String token;
  String name;

  Login({required this.token, required this.name});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      token: json['token'] ?? '', // Default value if null
      name: json['name'] ?? '', // Default value if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'name': name,
    };
  }
}
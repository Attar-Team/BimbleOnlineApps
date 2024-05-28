class Token {
  final String token;
  final String name;

  Token({
    required this.token,
    required this.name,
  });

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      token: json['token'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'name': name,
    };
  }
}
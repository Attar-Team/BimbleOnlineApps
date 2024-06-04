import '../login.dart';

class LoginResponse{
  bool status;
  String message;
  Login data;

  LoginResponse({required this.status, required this.message, required this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'] ?? false, // Default value if null
      message: json['message'] ?? '', // Default value if null
      data: Login.fromJson(json['data'] ?? {}), // Default value if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(),
    };
  }
}
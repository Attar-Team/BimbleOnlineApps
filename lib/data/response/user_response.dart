import 'package:bumn_muda/data/user.dart';

class UserResponse{
  int status;
  String message;
  UserData data;

  UserResponse({required this.status, required this.message, required this.data});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      status: json['status'] ?? false, // Default value if null
      message: json['message'] ?? '', // Default value if null
      data: UserData.fromJson(json['data'] ?? {}), // Default value if null
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
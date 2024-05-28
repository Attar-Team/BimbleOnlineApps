import 'dart:ffi';

import '../token.dart';

class loginResponse {
  final bool status;
  final String message;
  final Token data;

  loginResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory loginResponse.fromJson(Map<String, dynamic> json) {
    return loginResponse(
      status: json['status'],
      message: json['message'],
      data: Token.fromJson(json['data']),
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
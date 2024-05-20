import '../paket.dart';

class ApiResponse {
  final int status;
  final String message;
  final List<Package> data;

  ApiResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    var listPackageJson = json['data'] as List;
    List<Package> packages = listPackageJson.map((i) => Package.fromJson(i)).toList();

    return ApiResponse(
      status: json['status'],
      message: json['message'],
      data: packages,
    );
  }
}

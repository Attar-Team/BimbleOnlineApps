import '../paket_terbeli.dart';

class PaketTerbeliResponse {
  final int status;
  final String message;
  final List<PaketTerbeli> data;

  PaketTerbeliResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PaketTerbeliResponse.fromJson(Map<String, dynamic> json) {
    var listPackageJson = json['data'] as List? ?? []; // Default to empty list if null
    List<PaketTerbeli> packages = listPackageJson.map((i) => PaketTerbeli.fromJson(i)).toList();

    return PaketTerbeliResponse(
      status: json['status'] ?? 0, // Default value if null
      message: json['message'] ?? '', // Default value if null
      data: packages,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((paket) => paket.toJson()).toList(),
    };
  }
}

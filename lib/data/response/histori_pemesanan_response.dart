import '../histori_pemesanan.dart';

class HistoriPemesananResponse {
  final int status;
  final String message;
  final List<HistoriPemesanan> data;

  HistoriPemesananResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory HistoriPemesananResponse.fromJson(Map<String, dynamic> json) {
    var listPackageJson = json['data'] as List? ?? []; // Default to empty list if null
    List<HistoriPemesanan> packages = listPackageJson.map((i) => HistoriPemesanan.fromJson(i)).toList();

    return HistoriPemesananResponse(
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

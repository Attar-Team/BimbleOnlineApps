class   HistoriPemesanan {
  final String id;
  final int userId;
  final DateTime date;
  final String grossAmount;
  final String status;
  final List<String> packageIds;

  HistoriPemesanan({
    required this.id,
    required this.userId,
    required this.date,
    required this.grossAmount,
    required this.status,
    required this.packageIds,
  });

  // Factory method to create an instance of HistoriPemesanan from a JSON map
  factory HistoriPemesanan.fromJson(Map<String, dynamic> json) {
    return HistoriPemesanan(
      id: json['id'],
      userId: json['user_id'],
      date: DateTime.parse(json['date']),
      grossAmount: json['gross_amount'],
      status: json['status'],
      packageIds: List<String>.from(json['package_id']),
    );
  }

  // Method to convert an instance of HistoriPemesanan to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'date': date.toIso8601String(),
      'gross_amount': grossAmount,
      'status': status,
      'package_id': packageIds,
    };
  }
}
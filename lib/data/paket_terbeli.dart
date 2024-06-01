class PaketTerbeli {
  final int id;
  final String orderId;
  final String packageId;
  final String createdAt;
  final String updatedAt;
  final String userId;
  final String date;
  final String grossAmount;
  final String status;

  PaketTerbeli({
    required this.id,
    required this.orderId,
    required this.packageId,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.date,
    required this.grossAmount,
    required this.status,
  });

  factory PaketTerbeli.fromJson(Map<String, dynamic> json) {
    return PaketTerbeli(
      id: json['id'] ?? 0, // Default value if null
      orderId: json['order_id'] ?? '', // Default value if null
      packageId: json['package_id'] ?? '', // Default value if null
      createdAt: json['created_at'] ?? '', // Default value if null
      updatedAt: json['updated_at'] ?? '', // Default value if null
      userId: json['user_id'] ?? '', // Default value if null
      date: json['date'] ?? '', // Default value if null
      grossAmount: json['gross_amount'] ?? '', // Default value if null
      status: json['status'] ?? '', // Default value if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_id': orderId,
      'package_id': packageId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'user_id': userId,
      'date': date,
      'gross_amount': grossAmount,
      'status': status,
    };
  }
}

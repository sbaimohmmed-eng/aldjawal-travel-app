/// Represents a saved travel plan with budget
class SavedPlan {
  final String id;
  final String countryName;
  final String countryNameAr;
  final String visaStatus;
  final double totalBudgetUSD;
  final DateTime createdAt;
  final DateTime? travelDate;
  final String passportUsed;
  final double flightCostUSD;
  final double hotelCostUSD;
  final double visaFeeUSD;
  final int estimatedDays;

  SavedPlan({
    required this.id,
    required this.countryName,
    required this.countryNameAr,
    required this.visaStatus,
    required this.totalBudgetUSD,
    required this.createdAt,
    this.travelDate,
    required this.passportUsed,
    required this.flightCostUSD,
    required this.hotelCostUSD,
    required this.visaFeeUSD,
    required this.estimatedDays,
  });

  double get dailyBudgetUSD => totalBudgetUSD / estimatedDays;

  factory SavedPlan.fromJson(Map<String, dynamic> json) {
    return SavedPlan(
      id: json['id'] as String,
      countryName: json['countryName'] as String,
      countryNameAr: json['countryNameAr'] as String,
      visaStatus: json['visaStatus'] as String,
      totalBudgetUSD: (json['totalBudgetUSD'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      travelDate: json['travelDate'] != null
          ? DateTime.parse(json['travelDate'] as String)
          : null,
      passportUsed: json['passportUsed'] as String,
      flightCostUSD: (json['flightCostUSD'] as num).toDouble(),
      hotelCostUSD: (json['hotelCostUSD'] as num).toDouble(),
      visaFeeUSD: (json['visaFeeUSD'] as num).toDouble(),
      estimatedDays: json['estimatedDays'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'countryName': countryName,
        'countryNameAr': countryNameAr,
        'visaStatus': visaStatus,
        'totalBudgetUSD': totalBudgetUSD,
        'createdAt': createdAt.toIso8601String(),
        'travelDate': travelDate?.toIso8601String(),
        'passportUsed': passportUsed,
        'flightCostUSD': flightCostUSD,
        'hotelCostUSD': hotelCostUSD,
        'visaFeeUSD': visaFeeUSD,
        'estimatedDays': estimatedDays,
      };
}

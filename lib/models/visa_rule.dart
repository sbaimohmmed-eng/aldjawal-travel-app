import 'package:flutter/material.dart';
import 'package:aldjawal_travel_app/models/visa_status.dart';

/// Represents visa requirements for a country
class VisaRule {
  final String countryCode;
  final String countryName;
  final VisaStatus status;
  final int allowedDays;
  final double visaFeeUSD;
  final String? officialUrl;
  final Color statusColor;

  VisaRule({
    required this.countryCode,
    required this.countryName,
    required this.status,
    required this.allowedDays,
    required this.visaFeeUSD,
    this.officialUrl,
    required this.statusColor,
  });

  bool get isEVisa => status == VisaStatus.eVisa && officialUrl != null;
  bool get isVisaFree => status == VisaStatus.visaFree;
  bool get requiresVisa =>
      status == VisaStatus.visaRequired || status == VisaStatus.eVisa;

  factory VisaRule.fromJson(Map<String, dynamic> json) {
    return VisaRule(
      countryCode: json['countryCode'] as String,
      countryName: json['countryName'] as String,
      status: VisaStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => VisaStatus.unknown,
      ),
      allowedDays: json['allowedDays'] as int? ?? 0,
      visaFeeUSD: (json['visaFeeUSD'] as num?)?.toDouble() ?? 0.0,
      officialUrl: json['officialUrl'] as String?,
      statusColor: Color(json['statusColor'] as int),
    );
  }

  Map<String, dynamic> toJson() => {
        'countryCode': countryCode,
        'countryName': countryName,
        'status': status.name,
        'allowedDays': allowedDays,
        'visaFeeUSD': visaFeeUSD,
        'officialUrl': officialUrl,
        'statusColor': statusColor.value,
      };
}

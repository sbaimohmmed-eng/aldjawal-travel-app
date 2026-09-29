import 'package:latlong2/latlong.dart';

/// Represents a country with its geographic data
class Country {
  final String isoCode;
  final String name;
  final String nameAr;
  final List<LatLng> boundaryPoints;
  final double latitude;
  final double longitude;

  Country({
    required this.isoCode,
    required this.name,
    required this.nameAr,
    required this.boundaryPoints,
    required this.latitude,
    required this.longitude,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    final List<dynamic> points = json['boundaryPoints'] as List<dynamic>? ?? [];
    return Country(
      isoCode: json['isoCode'] as String,
      name: json['name'] as String,
      nameAr: json['nameAr'] as String,
      boundaryPoints: points
          .cast<Map<String, dynamic>>()
          .map((p) => LatLng(
                p['lat'] as double,
                p['lng'] as double,
              ))
          .toList(),
      latitude: json['latitude'] as double? ?? 0.0,
      longitude: json['longitude'] as double? ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
        'isoCode': isoCode,
        'name': name,
        'nameAr': nameAr,
        'boundaryPoints': boundaryPoints
            .map((p) => {'lat': p.latitude, 'lng': p.longitude})
            .toList(),
        'latitude': latitude,
        'longitude': longitude,
      };
}

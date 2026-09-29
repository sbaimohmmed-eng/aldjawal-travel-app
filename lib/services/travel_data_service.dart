import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Service for fetching travel-related data from backend API
class TravelDataService {
  final Dio _dio;
  final String _baseUrl;

  TravelDataService({
    String baseUrl = 'https://your-api.example.com',
    Dio? dio,
  })
      : _baseUrl = baseUrl,
        _dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: baseUrl,
                connectTimeout: const Duration(seconds: 10),
                receiveTimeout: const Duration(seconds: 10),
                contentType: Headers.jsonContentType,
              ),
            );

  /// Fetch live flight prices from backend (NOT from Flutter app)
  /// Backend queries Amadeus or similar API
  Future<Map<String, dynamic>> fetchLiveFlightPrices(
    String origin,
    String destination,
  ) async {
    try {
      final response = await _dio.get(
        '/api/v1/flights/prices',
        queryParameters: {
          'origin': origin,
          'destination': destination,
        },
      );

      return {
        'success': true,
        'flightPrice': (response.data['price'] as num).toDouble(),
        'currency': response.data['currency'] ?? 'USD',
        'updatedAt': DateTime.now().toIso8601String(),
      };
    } on DioException catch (e) {
      debugPrint('Flight price fetch error: ${e.message}');
      return {
        'success': false,
        'error': e.message,
        'flightPrice': 350.0, // Fallback
      };
    }
  }

  /// Fetch hotel accommodation prices
  Future<Map<String, dynamic>> fetchHotelPrices(
    String destination,
    int nights,
  ) async {
    try {
      final response = await _dio.get(
        '/api/v1/hotels/prices',
        queryParameters: {
          'destination': destination,
          'nights': nights,
        },
      );

      return {
        'success': true,
        'hotelPricePerNight': (response.data['pricePerNight'] as num).toDouble(),
        'currency': response.data['currency'] ?? 'USD',
      };
    } on DioException catch (e) {
      debugPrint('Hotel price fetch error: ${e.message}');
      return {
        'success': false,
        'error': e.message,
        'hotelPricePerNight': 60.0, // Fallback
      };
    }
  }

  /// Fetch visa requirements for a country
  Future<Map<String, dynamic>> fetchVisaRequirements(
    String passportCode,
    String destinationCode,
  ) async {
    try {
      final response = await _dio.get(
        '/api/v1/visa/requirements',
        queryParameters: {
          'passportCode': passportCode,
          'destinationCode': destinationCode,
        },
      );

      return {
        'success': true,
        'status': response.data['status'],
        'allowedDays': response.data['allowedDays'],
        'visaFee': (response.data['visaFee'] as num?)?.toDouble() ?? 0.0,
        'officialUrl': response.data['officialUrl'],
      };
    } on DioException catch (e) {
      debugPrint('Visa requirements fetch error: ${e.message}');
      return {
        'success': false,
        'error': e.message,
      };
    }
  }

  /// Save a travel plan to user account (requires authentication)
  Future<Map<String, dynamic>> saveTravelPlan(
    String userId,
    Map<String, dynamic> planData,
  ) async {
    try {
      final response = await _dio.post(
        '/api/v1/travel-plans',
        data: {
          'userId': userId,
          ...planData,
        },
      );

      return {
        'success': true,
        'planId': response.data['id'],
        'message': 'Travel plan saved successfully',
      };
    } on DioException catch (e) {
      debugPrint('Save travel plan error: ${e.message}');
      return {
        'success': false,
        'error': e.message,
      };
    }
  }

  void dispose() {
    _dio.close();
  }
}

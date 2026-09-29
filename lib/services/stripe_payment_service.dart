import 'package:flutter/foundation.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:dio/dio.dart';

/// Secure Stripe payment service
/// Secret Key is kept on backend ONLY
class StripePaymentService {
  final Dio _dio;
  final String _backendUrl;

  StripePaymentService({
    required String backendUrl,
    Dio? dio,
  })
      : _backendUrl = backendUrl,
        _dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: backendUrl,
                connectTimeout: const Duration(seconds: 10),
                receiveTimeout: const Duration(seconds: 10),
              ),
            );

  /// Create PaymentIntent on secure backend
  /// Backend uses Secret Key internally
  Future<String?> _createPaymentIntent({
    required int amountInCents,
    required String currency,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      final response = await _dio.post(
        '/api/v1/stripe/create-payment-intent',
        data: {
          'amount': amountInCents,
          'currency': currency,
          'metadata': metadata,
        },
      );

      return response.data['clientSecret'] as String?;
    } on DioException catch (e) {
      debugPrint('Error creating PaymentIntent: ${e.message}');
      return null;
    }
  }

  /// Process payment with Flutter Stripe
  Future<bool> processPayment({
    required double amountInDollars,
    required String currency,
    required String description,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      // Convert to cents
      final amountInCents = (amountInDollars * 100).toInt();

      // Create PaymentIntent on backend
      final clientSecret = await _createPaymentIntent(
        amountInCents: amountInCents,
        currency: currency.toLowerCase(),
        metadata: metadata,
      );

      if (clientSecret == null) {
        debugPrint('Failed to create PaymentIntent');
        return false;
      }

      // Initialize PaymentSheet with secure client secret
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'Aldjawal Travel',
          style: ThemeMode.dark,
        ),
      );

      // Present PaymentSheet to user
      await Stripe.instance.presentPaymentSheet();

      return true;
    } on StripeException catch (e) {
      debugPrint('Stripe error: ${e.error.localizedMessage}');
      return false;
    } catch (e) {
      debugPrint('Payment error: $e');
      return false;
    }
  }

  void dispose() {
    _dio.close();
  }
}

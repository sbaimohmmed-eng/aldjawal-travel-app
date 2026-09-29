import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:aldjawal_travel_app/providers/locale_provider.dart';
import 'package:aldjawal_travel_app/screens/main_navigation_screen.dart';
import 'package:aldjawal_travel_app/constants/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Stripe with Publishable Key only (NO SECRET KEY)
  Stripe.publishableKey = const String.fromEnvironment(
    'STRIPE_PUBLISHABLE_KEY',
    defaultValue: 'pk_test_YOUR_STRIPE_PUBLISHABLE_KEY',
  );

  Stripe.merchantIdentifier = 'merchant.com.aldjawal';

  runApp(const SmartTravelApp());
}

class SmartTravelApp extends StatelessWidget {
  const SmartTravelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LocaleProvider(),
      child: Consumer<LocaleProvider>(
        builder: (context, localeProvider, _) {
          return MaterialApp(
            title: 'جَوَّال | ALDJAWAL',
            debugShowCheckedModeBanner: false,
            locale: Locale(localeProvider.currentLocale),
            supportedLocales: const [
              Locale('ar'),
              Locale('en'),
              Locale('fr'),
            ],
            theme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: AppColors.darkNavy,
              scaffoldBackgroundColor: AppColors.darkNavy,
              fontFamily: 'Cairo',
              useMaterial3: true,
            ),
            home: Directionality(
              textDirection: localeProvider.isArabic
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: const MainNavigationScreen(),
            ),
          );
        },
      ),
    );
  }
}

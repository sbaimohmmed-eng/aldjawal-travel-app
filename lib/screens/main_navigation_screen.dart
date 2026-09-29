import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aldjawal_travel_app/providers/locale_provider.dart';
import 'package:aldjawal_travel_app/screens/passport_map_screen.dart';
import 'package:aldjawal_travel_app/screens/saved_plans_screen.dart';
import 'package:aldjawal_travel_app/screens/budget_planner_screen.dart';
import 'package:aldjawal_travel_app/constants/app_strings.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({Key? key}) : super(key: key);

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final strings = AppStrings.get(localeProvider.currentLocale);

    final screens = [
      const PassportMapScreen(),
      const BudgetPlannerScreen(),
      const SavedPlansScreen(),
    ];

    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: const Color(0xFF1E1E1E),
        selectedItemColor: const Color(0xFFFF6B35),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.map),
            label: strings['nav_map'] ?? 'Map',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.savings),
            label: strings['nav_budget'] ?? 'Budget',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.folder_special),
            label: strings['nav_plans'] ?? 'Plans',
          ),
        ],
      ),
    );
  }
}

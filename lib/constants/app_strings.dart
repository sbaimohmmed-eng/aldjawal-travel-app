/// Localized strings for the app
class AppStrings {
  static Map<String, String> get(String locale) {
    switch (locale) {
      case 'ar':
        return _arabicStrings;
      case 'fr':
        return _frenchStrings;
      default:
        return _englishStrings;
    }
  }

  static const Map<String, String> _arabicStrings = {
    'nav_map': 'الخريطة والمؤشر',
    'nav_budget': 'ميزانيتك',
    'nav_plans': 'خططي وميزانياتي',
    'app_title': 'مستشار ومؤشر السفر الذكي',
    'passport_select': 'الجواز المعتمد',
    'lang_title': 'إعدادات اللغة',
    'trip_to': '✈️ خطة السفر إلى:',
    'visa_status': 'حالة التأشيرة الحالية:',
    'stay_days': 'مدة الإقامة المسموحة:',
    'smart_tip': '💡 نصيحة ذكية: استخدام جوازك الآخر يعفيك من التأشيرة!',
    'budget_calc': '📊 حاسبة الميزانية اللحظية:',
    'total_cost': '💰 التكلفة الإجمالية المقدرة:',
    'save_plan': 'حفظ برنامج السفر',
    'apply_now': 'قدم الآن عبر الموقع الحكومي الرسمي',
    'success_save': '✅ تم حفظ برنامج السفر والميزانية بنجاح!',
    'no_plans': 'لا توجد خطط محفوظة حالياً',
  };

  static const Map<String, String> _englishStrings = {
    'nav_map': 'Map & Index',
    'nav_budget': 'Budget Planner',
    'nav_plans': 'My Plans & Budgets',
    'app_title': 'Smart Travel & Passport Index',
    'passport_select': 'Active Passport',
    'lang_title': 'Language Settings',
    'trip_to': '✈️ Trip Plan to:',
    'visa_status': 'Current Visa Status:',
    'stay_days': 'Allowed Duration of Stay:',
    'smart_tip': '💡 Smart Tip: Use your other passport for visa-free access!',
    'budget_calc': '📊 Budget Breakdown:',
    'total_cost': '💰 Total Estimated Budget:',
    'save_plan': 'Save Trip Plan',
    'apply_now': 'Apply Now on Official Government Site',
    'success_save': '✅ Trip plan and budget saved successfully!',
    'no_plans': 'No saved plans yet',
  };

  static const Map<String, String> _frenchStrings = {
    'nav_map': 'Carte & Index',
    'nav_budget': 'Planificateur de Budget',
    'nav_plans': 'Mes Plans & Budgets',
    'app_title': 'Index des Passeports Intelligent',
    'passport_select': 'Passeport Actif',
    'lang_title': 'Paramètres de Langue',
    'trip_to': '✈️ Plan de voyage vers:',
    'visa_status': 'Statut actuel du visa:',
    'stay_days': 'Durée de séjour autorisée:',
    'smart_tip': '💡 Conseil: Voyager avec votre autre passeport vous exempte de visa!',
    'budget_calc': '📊 Breakdown du Budget:',
    'total_cost': '💰 Budget Total Estimé:',
    'save_plan': 'Enregistrer le plan de voyage',
    'apply_now': 'Postuler sur le site gouvernemental officiel',
    'success_save': '✅ Plan de voyage enregistré avec succès!',
    'no_plans': 'Aucun plan sauvegardé pour l\'instant',
  };
}

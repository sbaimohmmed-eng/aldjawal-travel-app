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

  static const Map<String, String> _englishStrings = {\n    'nav_map': 'Map & Index',\n    'nav_budget': 'Budget Planner',\n    'nav_plans': 'My Plans & Budgets',\n    'app_title': 'Smart Travel & Passport Index',\n    'passport_select': 'Active Passport',\n    'lang_title': 'Language Settings',\n    'trip_to': '✈️ Trip Plan to:',\n    'visa_status': 'Current Visa Status:',\n    'stay_days': 'Allowed Duration of Stay:',\n    'smart_tip': '💡 Smart Tip: Use your other passport for visa-free access!',\n    'budget_calc': '📊 Budget Breakdown:',\n    'total_cost': '💰 Total Estimated Budget:',\n    'save_plan': 'Save Trip Plan',\n    'apply_now': 'Apply Now on Official Government Site',\n    'success_save': '✅ Trip plan and budget saved successfully!',\n    'no_plans': 'No saved plans yet',\n  };\n\n  static const Map<String, String> _frenchStrings = {\n    'nav_map': 'Carte & Index',\n    'nav_budget': 'Planificateur de Budget',\n    'nav_plans': 'Mes Plans & Budgets',\n    'app_title': 'Index des Passeports Intelligent',\n    'passport_select': 'Passeport Actif',\n    'lang_title': 'Paramètres de Langue',\n    'trip_to': '✈️ Plan de voyage vers:',\n    'visa_status': 'Statut actuel du visa:',\n    'stay_days': 'Durée de séjour autorisée:',\n    'smart_tip': '💡 Conseil: Voyager avec votre autre passeport vous exempte de visa!',\n    'budget_calc': '📊 Breakdown du Budget:',\n    'total_cost': '💰 Budget Total Estimé:',\n    'save_plan': 'Enregistrer le plan de voyage',\n    'apply_now': 'Postuler sur le site gouvernemental officiel',\n    'success_save': '✅ Plan de voyage enregistré avec succès!',\n    'no_plans': 'Aucun plan sauvegardé pour l\\'instant',\n  };\n}\n
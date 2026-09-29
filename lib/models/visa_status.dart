/// Enum for visa status types
enum VisaStatus {
  visaFree('دخول بدون تأشيرة', 'Visa-Free', 'Sans Visa'),
  eVisa('تأشيرة إلكترونية', 'e-Visa', 'e-Visa'),
  visaOnArrival('تأشيرة عند الوصول', 'Visa on Arrival', 'Visa à l\'arrivée'),
  visaRequired('تأشيرة مسبقة مطلوبة', 'Visa Required', 'Visa Requise'),
  unknown('غير محدد', 'Unknown', 'Inconnu');

  final String ar;
  final String en;
  final String fr;

  const VisaStatus(this.ar, this.en, this.fr);

  String localize(String locale) {
    switch (locale) {
      case 'ar':
        return ar;
      case 'fr':
        return fr;
      default:
        return en;
    }
  }
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get helloWorld => 'مرحباً بالعالم';

  @override
  String get onboardingWelcomeTitle => 'مرحباً بك في نيكست هاير';

  @override
  String get onboardingWelcomeDesc => 'ابدأ بناء مستقبلك في العمل الحر اليوم.';

  @override
  String get onboardingStartBtn => 'ابدأ';

  @override
  String get onboardingSkipBtn => 'تخطى';

  @override
  String get onboardingFutureTitle => 'مستقبلك في العمل الحر يبدأ هنا';

  @override
  String get onboardingFutureDesc =>
      'ابنِ ملفك الشخصي، حسّن تقييمك، وتواصل مع المشاريع المناسبة أسرع من أي وقت مضى.';

  @override
  String get onboardingNextBtn => 'التالي';
}

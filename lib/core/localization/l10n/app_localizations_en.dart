// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World';

  @override
  String get onboardingWelcomeTitle => 'Welcome to NEXT HIRE';

  @override
  String get onboardingWelcomeDesc =>
      'Start building your freelance future today.';

  @override
  String get onboardingStartBtn => 'Start';

  @override
  String get onboardingSkipBtn => 'Skip';

  @override
  String get onboardingFutureTitle => 'Your Freelance Future Starts Here';

  @override
  String get onboardingFutureDesc =>
      'Build your profile, improve your score, and connect with the right projects faster than ever.';

  @override
  String get onboardingNextBtn => 'Next';
}

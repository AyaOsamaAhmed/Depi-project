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

  @override
  String get logIn => 'Sign In';

  @override
  String get signUp => 'Sign Up';

  @override
  String get email => 'E-mail';

  @override
  String get enterEmail => 'Enter Email';

  @override
  String get password => 'Password';

  @override
  String get enterPassword => 'Enter Password';

  @override
  String get forgetPassword => 'Forget Password?';

  @override
  String get dontHaveAccount => 'Don\'t Have An Account?';

  @override
  String get alreadyHaveAccount => 'Already Have An Account?';

  @override
  String get firstName => 'First Name';

  @override
  String get enterFirstName => 'Enter First Name';

  @override
  String get lastName => 'Last Name';

  @override
  String get enterLastName => 'Enter Last Name';

  @override
  String get loginSuccess => 'Login Success';

  @override
  String get signupSuccess => 'Signup Success';

  @override
  String get enterBothEmailAndPassword =>
      'Please enter both email and password.';

  @override
  String get fillAllFields => 'Please fill all the fields.';

  @override
  String get invalidEmail => 'Please enter a valid email address.';

  @override
  String get passwordTooShort => 'Password must be at least 8 characters.';

  @override
  String get passwordWeak =>
      'Password must contain uppercase, lowercase, number, and special character.';

  @override
  String get emailRequired => 'Email is required.';

  @override
  String get passwordRequired => 'Password is required.';

  @override
  String get isRequired => 'is required.';

  @override
  String get invalidCredentials => 'Incorrect email or password.';

  @override
  String get freelancer => 'Freelancer';

  @override
  String get client => 'Client';
}

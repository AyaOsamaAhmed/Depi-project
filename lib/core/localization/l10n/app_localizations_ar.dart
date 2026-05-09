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
  String get logIn => 'تسجيل الدخول';

  @override
  String get signUp => 'إنشاء حساب';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get enterEmail => 'أدخل البريد الإلكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get enterPassword => 'أدخل كلمة المرور';

  @override
  String get forgetPassword => 'هل نسيت كلمة المرور؟';

  @override
  String get dontHaveAccount => 'ليس لديك حساب؟';

  @override
  String get alreadyHaveAccount => 'لديك حساب بالفعل؟';

  @override
  String get firstName => 'الاسم الأول';

  @override
  String get enterFirstName => 'أدخل الاسم الأول';

  @override
  String get lastName => 'الاسم الأخير';

  @override
  String get enterLastName => 'أدخل الاسم الأخير';

  @override
  String get loginSuccess => 'تم تسجيل الدخول بنجاح';

  @override
  String get signupSuccess => 'تم إنشاء الحساب بنجاح';

  @override
  String get enterBothEmailAndPassword =>
      'الرجاء إدخال البريد الإلكتروني وكلمة المرور.';

  @override
  String get fillAllFields => 'الرجاء ملء جميع الحقول.';

  @override
  String get invalidEmail => 'الرجاء إدخال بريد إلكتروني صالح.';

  @override
  String get passwordTooShort =>
      'كلمة المرور يجب أن تتكون من 6 أحرف على الأقل.';

  @override
  String get invalidCredentials =>
      'البريد الإلكتروني أو كلمة المرور غير صحيحة.';
}

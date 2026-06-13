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
      'كلمة المرور يجب أن تتكون من 8 أحرف على الأقل.';

  @override
  String get passwordWeak =>
      'يجب أن تحتوي كلمة المرور على أحرف كبيرة وصغيرة وأرقام ورموز خاصة.';

  @override
  String get emailRequired => 'البريد الإلكتروني مطلوب.';

  @override
  String get passwordRequired => 'كلمة المرور مطلوبة.';

  @override
  String get isRequired => 'مطلوب.';

  @override
  String get invalidCredentials =>
      'البريد الإلكتروني أو كلمة المرور غير صحيحة.';

  @override
  String get freelancer => 'مستقل';

  @override
  String get client => 'عميل';

  @override
  String get freelancerProfile => 'الملف الشخصي للمستقل';

  @override
  String get rating => 'التقييم';

  @override
  String get projects => 'المشاريع';

  @override
  String get earned => 'الأرباح';

  @override
  String get about => 'عن المستقل';

  @override
  String get skills => 'المهارات';

  @override
  String get profile => 'معرض الأعمال';

  @override
  String get message => 'رسالة';

  @override
  String get hireFreelancer => 'توظيف المستقل';

  @override
  String get projectLiveTitle => 'مشروعك الآن متاح!';

  @override
  String get projectLiveSubtitle =>
      'أخبرنا بما تحتاجه وسنساعدك في العثور على أفضل المستقلين';

  @override
  String get whatsNext => 'ماذا بعد؟';

  @override
  String get createContractMilestone => 'إنشاء عقد ومراحل العمل';

  @override
  String get workTogetherTrackProgress => 'اعملوا معاً وتابعوا التقدم';

  @override
  String get viewProject => 'عرض المشروع';

  @override
  String get goToDashboard => 'الذهاب إلى لوحة التحكم';

  @override
  String get analytics => 'التحليلات';

  @override
  String get overviews => 'نظرة عامة';

  @override
  String get topSkills => 'أبرز المهارات';

  @override
  String get totalEarnings => 'إجمالي الأرباح';

  @override
  String get thisMonth => 'هذا الشهر';

  @override
  String fromLastMonth(int percentage) {
    return '+$percentage% من الشهر الماضي';
  }

  @override
  String get proposalSentCount => 'العروض المرسلة';

  @override
  String get projectWonCount => 'المشاريع الفائزة';

  @override
  String get avgRating => 'متوسط التقييم';

  @override
  String projectsCount(int count) {
    return '$count مشاريع';
  }

  @override
  String get projectCompleted => 'اكتمل المشروع!';

  @override
  String get congratulationCompleted =>
      'تهانينا! تم إكمال مشروعك والموافقة عليه بنجاح.';

  @override
  String get viewDetails => 'عرض التفاصيل';

  @override
  String get backToDashboard => 'العودة إلى لوحة التحكم';

  @override
  String get withdrawFunds => 'سحب الأموال';

  @override
  String get paymentMethods => 'طرق الدفع';

  @override
  String get amount => 'المبلغ';

  @override
  String get availableBalance => 'الرصيد المتاح';

  @override
  String get instaPay => 'انستا باي';

  @override
  String get bankTransfer => 'تحويل بنكي';

  @override
  String get payPal => 'بايبال';

  @override
  String get withdrawNow => 'اسحب الآن';

  @override
  String get acceptInvite => 'قبول الدعوة';

  @override
  String get decline => 'رفض';

  @override
  String get jobDetails => 'تفاصيل الوظيفة';

  @override
  String get fixedPrices => 'أسعار ثابتة';

  @override
  String get webDesigner => 'مصمم ويب';

  @override
  String get uiuxDesigner => 'مصمم واجهة وتجربة المستخدم';

  @override
  String get jobDescription => 'وصف الوظيفة';

  @override
  String get requirements => 'المتطلبات';

  @override
  String get submitProposal => 'تقديم عرض';

  @override
  String get projectOverview => 'نظرة عامة على المشروع';

  @override
  String get milestones => 'مراحل العمل';

  @override
  String get projectFiles => 'ملفات المشروع';

  @override
  String get inProgress => 'قيد التنفيذ';

  @override
  String get pending => 'قيد الانتظار';

  @override
  String get workshop => 'ورشة العمل';

  @override
  String get hello => 'مرحباً';

  @override
  String get dashboardGreeting => 'نتمنى لك يوماً سعيداً في العمل';

  @override
  String get aiProfileScore => 'درجة ملف الذكاء الاصطناعي';

  @override
  String get greatJob => 'عمل رائع!';

  @override
  String get completeProfileDesc =>
      'أكمل ملفك الشخصي للحصول على المزيد من المشاريع';

  @override
  String get improveProfile => 'تحسين الملف الشخصي';

  @override
  String get wallet => 'المحفظة';

  @override
  String get proposals => 'العروض';

  @override
  String get contract => 'العقود';

  @override
  String get active => 'نشط';

  @override
  String get news => 'جديد';

  @override
  String get recommendedForYou => 'موجه لك';

  @override
  String get recentActivity => 'النشاط الأخير';

  @override
  String get viewAll => 'عرض الكل';

  @override
  String get featured => 'مميز';

  @override
  String get daysLeft => 'أيام متبقية';

  @override
  String get match => 'متطابق';

  @override
  String get upgradeToPro => 'الترقية للبريد';

  @override
  String get upgradeToProDesc => 'احصل على وصول غير محدود لجميع المميزات';

  @override
  String get youAreInvited => 'أنت مدعو!';

  @override
  String invitedBy(String name) {
    return 'تمت دعوتك من قبل $name للعمل في هذا المشروع.';
  }

  @override
  String get online => 'متصل';

  @override
  String get typeMessage => 'أكتب رسالة...';

  @override
  String get earnings => 'الأرباح';

  @override
  String get transactions => 'المعاملات';

  @override
  String get completeProfileTitle => 'إكمال الملف الشخصي';

  @override
  String get fullNameLabel => 'الاسم بالكامل';

  @override
  String get titleLabel => 'العنوان الوظيفي';

  @override
  String get monthlyRateLabel => 'المعدل الشهري';

  @override
  String get addSkillLabel => 'إضافة مهارة';

  @override
  String get saveChangesButton => 'حفظ التغييرات';

  @override
  String get findYourNextProject => 'ابحث عن مشروعك التالي';

  @override
  String get searchPlaceholder => 'البحث عن مشروع...';

  @override
  String get all => 'الكل';

  @override
  String get uiuxDesign => 'تصميم واجهة وتجربة المستخدم';

  @override
  String get webDevelopment => 'تطوير الويب';

  @override
  String get mobileAppDesign => 'تصميم تطبيقات الهاتف';

  @override
  String get noResultsFound => 'لم يتم العثور على نتائج';

  @override
  String get experienceLevel => 'مستوى الخبرة';

  @override
  String get proposalSentTitle => 'تم إرسال العرض!';

  @override
  String get proposalSentSuccess => 'تم تقديم عرضك بنجاح.';

  @override
  String get proposalSentNotify =>
      'سيتم إخطار العميل وسوف تتلقى رداً إذا كان مهتماً.';

  @override
  String get viewMyProposals => 'عرض عروضي';

  @override
  String get backToJob => 'العودة للوظيفة';

  @override
  String get rateClient => 'تقييم العميل';

  @override
  String rateExperience(String name) {
    return 'كيف كانت تجربتك في العمل مع $name؟';
  }

  @override
  String get writeReview => 'اكتب مراجعة';

  @override
  String get optional => 'اختياري';

  @override
  String get submitReview => 'إرسال المراجعة';

  @override
  String get yourProposal => 'عرضك';

  @override
  String get bidAmount => 'مبلغ العطاء';

  @override
  String get deliveryTime => 'وقت التسليم';

  @override
  String get attachments => 'المرفقات';

  @override
  String get writeProposalHint => 'اكتب عرضك هنا...';

  @override
  String get file => 'ملف';

  @override
  String get submitWork => 'تسليم العمل';

  @override
  String get milestone => 'مرحلة العمل';

  @override
  String get deliverables => 'المخرجات';

  @override
  String get description => 'الوصف';

  @override
  String get submitForReview => 'إرسال للمراجعة';

  @override
  String get addMoreFiles => 'إضافة المزيد من الملفات';

  @override
  String get workApprovedTitle => 'تمت الموافقة على العمل!';

  @override
  String get workApprovedSuccess => 'تمت الموافقة على عملك بنجاح.';

  @override
  String get addedToBalance => 'تمت إضافة المبلغ إلى رصيدك.';

  @override
  String get viewPayment => 'عرض الدفع';

  @override
  String get search => 'بحث';

  @override
  String get messages => 'الرسائل';

  @override
  String get notificationsTitle => 'التنبيهات';

  @override
  String get allTab => 'الكل';

  @override
  String get unreadTab => 'غير مقروء';

  @override
  String get mentionTab => 'إشارة';

  @override
  String get payment => 'الدفع';

  @override
  String get home => 'الرئيسية';

  @override
  String get walletTab => 'المحفظة';

  @override
  String get manageEverything => 'إدارة كل شيء في مكان واحد';

  @override
  String get currentBalance => 'الرصيد الحالي';

  @override
  String get addFunds => 'إضافة أموال';

  @override
  String get safeSecure => '100٪ آمن ومضمون';

  @override
  String get multiplePaymentMethods => 'طرق دفع متعددة';

  @override
  String get securePayments => 'مدفوعات آمنة';

  @override
  String get projectHistory => 'سجل المشاريع';

  @override
  String allProjectsCount(int count) {
    return 'كل المشاريع($count)';
  }

  @override
  String inProgressCount(int count) {
    return 'قيد التنفيذ($count)';
  }

  @override
  String completedCount(int count) {
    return 'مكتمل($count)';
  }

  @override
  String acceptCount(int count) {
    return 'مقبول($count)';
  }

  @override
  String declinedCount(int count) {
    return 'مرفوض($count)';
  }

  @override
  String proposedOn(String date) {
    return 'قُدم في $date';
  }

  @override
  String get lastUpdate => 'آخر تحديث';

  @override
  String get rejected => 'مرفوض';

  @override
  String get invited => 'مدعو';

  @override
  String get accepted => 'مقبول';

  @override
  String get declined => 'مرفوض';

  @override
  String get budget => 'الميزانية';
}

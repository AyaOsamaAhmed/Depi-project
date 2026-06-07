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

  @override
  String get freelancerProfile => 'Freelancer Profile';

  @override
  String get rating => 'Rating';

  @override
  String get projects => 'Projects';

  @override
  String get earned => 'Earned';

  @override
  String get about => 'About';

  @override
  String get skills => 'Skills';

  @override
  String get profile => 'Profile';

  @override
  String get message => 'Message';

  @override
  String get hireFreelancer => 'Hire Freelancer';

  @override
  String get projectLiveTitle => 'Your Project is now live!';

  @override
  String get projectLiveSubtitle =>
      'Tell us what you need and we will help you find the best freelancers';

  @override
  String get whatsNext => 'what\'s Next?';

  @override
  String get createContractMilestone => 'Create contract and milestone';

  @override
  String get workTogetherTrackProgress => 'Work together and track progress';

  @override
  String get viewProject => 'View Project';

  @override
  String get goToDashboard => 'Go to dashboard';

  @override
  String get getAIPrediction => 'Get AI price prediction';

  @override
  String get getAIPredictionDesc =>
      'Based on your project details, get AI-powered price suggestions from our database of similar past projects';

  @override
  String get projectDetails => 'Project Details';

  @override
  String get category => 'Category';

  @override
  String get projectTitle => 'project Title';

  @override
  String get budget => 'Budget';

  @override
  String get projectType => 'Project Type';

  @override
  String get requiredDocuments => 'Required Documents';

  @override
  String get addRequirements => 'Add Requirements';

  @override
  String get attachedFile => 'Attached File';

  @override
  String get recentRequirements => 'recent Requirements';

  @override
  String get aiPricePrediction => 'AI price prediction';

  @override
  String get aiEstimatedBudget => 'AI ESTIMATED BUDGET';

  @override
  String get basedOnProjectRequirementsAndMarketData =>
      'Based on project requirements and market data';

  @override
  String get priceBreakdown => 'Price breakdown';

  @override
  String get thisIsAPredictionYouCanAdjustTheBudgetBeforePublishing =>
      'This is a prediction. You can adjust the budget before publishing';

  @override
  String get publishProject => 'Publish Project';

  @override
  String get projectPublished => 'Project Published';

  @override
  String nameHiredForYourProject(Object name) {
    return '$name has been hired for your project';
  }

  @override
  String get youCanReviewAndHireTheBestFit =>
      'You can review and hire the best fit';

  @override
  String get freelanceCanSendProposals => 'Freelance can send proposals';

  @override
  String get createContract => 'create Contract';

  @override
  String get goToProject => 'Go to Project';
}

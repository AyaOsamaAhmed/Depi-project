import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// The conventional newborn programmer greeting
  ///
  /// In en, this message translates to:
  /// **'Hello World'**
  String get helloWorld;

  /// No description provided for @onboardingWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to NEXT HIRE'**
  String get onboardingWelcomeTitle;

  /// No description provided for @onboardingWelcomeDesc.
  ///
  /// In en, this message translates to:
  /// **'Start building your freelance future today.'**
  String get onboardingWelcomeDesc;

  /// No description provided for @onboardingStartBtn.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get onboardingStartBtn;

  /// No description provided for @onboardingSkipBtn.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkipBtn;

  /// No description provided for @onboardingFutureTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Freelance Future Starts Here'**
  String get onboardingFutureTitle;

  /// No description provided for @onboardingFutureDesc.
  ///
  /// In en, this message translates to:
  /// **'Build your profile, improve your score, and connect with the right projects faster than ever.'**
  String get onboardingFutureDesc;

  /// No description provided for @onboardingNextBtn.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNextBtn;

  /// No description provided for @logIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get logIn;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get email;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter Email'**
  String get enterEmail;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter Password'**
  String get enterPassword;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forget Password?'**
  String get forgetPassword;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t Have An Account?'**
  String get dontHaveAccount;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already Have An Account?'**
  String get alreadyHaveAccount;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @enterFirstName.
  ///
  /// In en, this message translates to:
  /// **'Enter First Name'**
  String get enterFirstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @enterLastName.
  ///
  /// In en, this message translates to:
  /// **'Enter Last Name'**
  String get enterLastName;

  /// No description provided for @loginSuccess.
  ///
  /// In en, this message translates to:
  /// **'Login Success'**
  String get loginSuccess;

  /// No description provided for @signupSuccess.
  ///
  /// In en, this message translates to:
  /// **'Signup Success'**
  String get signupSuccess;

  /// No description provided for @enterBothEmailAndPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter both email and password.'**
  String get enterBothEmailAndPassword;

  /// No description provided for @fillAllFields.
  ///
  /// In en, this message translates to:
  /// **'Please fill all the fields.'**
  String get fillAllFields;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address.'**
  String get invalidEmail;

  /// No description provided for @passwordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters.'**
  String get passwordTooShort;

  /// No description provided for @passwordWeak.
  ///
  /// In en, this message translates to:
  /// **'Password must contain uppercase, lowercase, number, and special character.'**
  String get passwordWeak;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required.'**
  String get emailRequired;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required.'**
  String get passwordRequired;

  /// No description provided for @isRequired.
  ///
  /// In en, this message translates to:
  /// **'is required.'**
  String get isRequired;

  /// No description provided for @invalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Incorrect email or password.'**
  String get invalidCredentials;

  /// No description provided for @freelancer.
  ///
  /// In en, this message translates to:
  /// **'Freelancer'**
  String get freelancer;

  /// No description provided for @client.
  ///
  /// In en, this message translates to:
  /// **'Client'**
  String get client;

  /// No description provided for @freelancerProfile.
  ///
  /// In en, this message translates to:
  /// **'Freelancer Profile'**
  String get freelancerProfile;

  /// No description provided for @rating.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get rating;

  /// No description provided for @projects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get projects;

  /// No description provided for @earned.
  ///
  /// In en, this message translates to:
  /// **'Earned'**
  String get earned;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @skills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get skills;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @hireFreelancer.
  ///
  /// In en, this message translates to:
  /// **'Hire Freelancer'**
  String get hireFreelancer;

  /// No description provided for @projectLiveTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Project is now live!'**
  String get projectLiveTitle;

  /// No description provided for @projectLiveSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tell us what you need and we will help you find the best freelancers'**
  String get projectLiveSubtitle;

  /// No description provided for @whatsNext.
  ///
  /// In en, this message translates to:
  /// **'what\'s Next?'**
  String get whatsNext;

  /// No description provided for @createContractMilestone.
  ///
  /// In en, this message translates to:
  /// **'Create contract and milestone'**
  String get createContractMilestone;

  /// No description provided for @workTogetherTrackProgress.
  ///
  /// In en, this message translates to:
  /// **'Work together and track progress'**
  String get workTogetherTrackProgress;

  /// No description provided for @viewProject.
  ///
  /// In en, this message translates to:
  /// **'View Project'**
  String get viewProject;

  /// No description provided for @goToDashboard.
  ///
  /// In en, this message translates to:
  /// **'Go to dashboard'**
  String get goToDashboard;

  /// No description provided for @analytics.
  ///
  /// In en, this message translates to:
  /// **'Analytics'**
  String get analytics;

  /// No description provided for @overviews.
  ///
  /// In en, this message translates to:
  /// **'Overviews'**
  String get overviews;

  /// No description provided for @topSkills.
  ///
  /// In en, this message translates to:
  /// **'Top Skills'**
  String get topSkills;

  /// No description provided for @totalEarnings.
  ///
  /// In en, this message translates to:
  /// **'Total Earnings'**
  String get totalEarnings;

  /// No description provided for @thisMonth.
  ///
  /// In en, this message translates to:
  /// **'This Month'**
  String get thisMonth;

  /// No description provided for @fromLastMonth.
  ///
  /// In en, this message translates to:
  /// **'+{percentage}% from last month'**
  String fromLastMonth(int percentage);

  /// No description provided for @proposalSentCount.
  ///
  /// In en, this message translates to:
  /// **'Proposal Sent'**
  String get proposalSentCount;

  /// No description provided for @projectWonCount.
  ///
  /// In en, this message translates to:
  /// **'Project Won'**
  String get projectWonCount;

  /// No description provided for @avgRating.
  ///
  /// In en, this message translates to:
  /// **'Avg. Rating'**
  String get avgRating;

  /// No description provided for @projectsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} Projects'**
  String projectsCount(int count);

  /// No description provided for @projectCompleted.
  ///
  /// In en, this message translates to:
  /// **'Project Completed!'**
  String get projectCompleted;

  /// No description provided for @congratulationCompleted.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! Your project has been successfully completed and approved.'**
  String get congratulationCompleted;

  /// No description provided for @viewDetails.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get viewDetails;

  /// No description provided for @backToDashboard.
  ///
  /// In en, this message translates to:
  /// **'Back to Dashboard'**
  String get backToDashboard;

  /// No description provided for @withdrawFunds.
  ///
  /// In en, this message translates to:
  /// **'Withdraw Funds'**
  String get withdrawFunds;

  /// No description provided for @paymentMethods.
  ///
  /// In en, this message translates to:
  /// **'Payment Methods'**
  String get paymentMethods;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @availableBalance.
  ///
  /// In en, this message translates to:
  /// **'Available Balance'**
  String get availableBalance;

  /// No description provided for @instaPay.
  ///
  /// In en, this message translates to:
  /// **'InstaPay'**
  String get instaPay;

  /// No description provided for @bankTransfer.
  ///
  /// In en, this message translates to:
  /// **'Bank Transfer'**
  String get bankTransfer;

  /// No description provided for @payPal.
  ///
  /// In en, this message translates to:
  /// **'PayPal'**
  String get payPal;

  /// No description provided for @withdrawNow.
  ///
  /// In en, this message translates to:
  /// **'Withdraw Now'**
  String get withdrawNow;

  /// No description provided for @acceptInvite.
  ///
  /// In en, this message translates to:
  /// **'Accept Invite'**
  String get acceptInvite;

  /// No description provided for @decline.
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get decline;

  /// No description provided for @jobDetails.
  ///
  /// In en, this message translates to:
  /// **'Job Details'**
  String get jobDetails;

  /// No description provided for @fixedPrices.
  ///
  /// In en, this message translates to:
  /// **'Fixed Prices'**
  String get fixedPrices;

  /// No description provided for @webDesigner.
  ///
  /// In en, this message translates to:
  /// **'Web Designer'**
  String get webDesigner;

  /// No description provided for @uiuxDesigner.
  ///
  /// In en, this message translates to:
  /// **'UI/UX Designer'**
  String get uiuxDesigner;

  /// No description provided for @jobDescription.
  ///
  /// In en, this message translates to:
  /// **'Job Description'**
  String get jobDescription;

  /// No description provided for @requirements.
  ///
  /// In en, this message translates to:
  /// **'Requirements'**
  String get requirements;

  /// No description provided for @submitProposal.
  ///
  /// In en, this message translates to:
  /// **'Submit Proposal'**
  String get submitProposal;

  /// No description provided for @projectOverview.
  ///
  /// In en, this message translates to:
  /// **'Project Overview'**
  String get projectOverview;

  /// No description provided for @milestones.
  ///
  /// In en, this message translates to:
  /// **'Milestones'**
  String get milestones;

  /// No description provided for @projectFiles.
  ///
  /// In en, this message translates to:
  /// **'Project Files'**
  String get projectFiles;

  /// No description provided for @inProgress.
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get inProgress;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @workshop.
  ///
  /// In en, this message translates to:
  /// **'Workshop'**
  String get workshop;

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get hello;

  /// No description provided for @dashboardGreeting.
  ///
  /// In en, this message translates to:
  /// **'Have a nice day at work'**
  String get dashboardGreeting;

  /// No description provided for @aiProfileScore.
  ///
  /// In en, this message translates to:
  /// **'AI Profile Score'**
  String get aiProfileScore;

  /// No description provided for @greatJob.
  ///
  /// In en, this message translates to:
  /// **'Great Job!'**
  String get greatJob;

  /// No description provided for @completeProfileDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete your profile to get more projects'**
  String get completeProfileDesc;

  /// No description provided for @improveProfile.
  ///
  /// In en, this message translates to:
  /// **'Improve Profile'**
  String get improveProfile;

  /// No description provided for @wallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get wallet;

  /// No description provided for @proposals.
  ///
  /// In en, this message translates to:
  /// **'Proposals'**
  String get proposals;

  /// No description provided for @contract.
  ///
  /// In en, this message translates to:
  /// **'Contract'**
  String get contract;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @news.
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get news;

  /// No description provided for @recommendedForYou.
  ///
  /// In en, this message translates to:
  /// **'Recommended For You'**
  String get recommendedForYou;

  /// No description provided for @recentActivity.
  ///
  /// In en, this message translates to:
  /// **'Recent Activity'**
  String get recentActivity;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @featured.
  ///
  /// In en, this message translates to:
  /// **'Featured'**
  String get featured;

  /// No description provided for @daysLeft.
  ///
  /// In en, this message translates to:
  /// **'Days Left'**
  String get daysLeft;

  /// No description provided for @match.
  ///
  /// In en, this message translates to:
  /// **'Match'**
  String get match;

  /// No description provided for @upgradeToPro.
  ///
  /// In en, this message translates to:
  /// **'Upgrade to Pro'**
  String get upgradeToPro;

  /// No description provided for @upgradeToProDesc.
  ///
  /// In en, this message translates to:
  /// **'Get unlimited access to all features'**
  String get upgradeToProDesc;

  /// No description provided for @youAreInvited.
  ///
  /// In en, this message translates to:
  /// **'You Are Invited!'**
  String get youAreInvited;

  /// No description provided for @invitedBy.
  ///
  /// In en, this message translates to:
  /// **'You\'ve been invited by {name} to work on this project.'**
  String invitedBy(String name);

  /// No description provided for @online.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get online;

  /// No description provided for @typeMessage.
  ///
  /// In en, this message translates to:
  /// **'Type Message...'**
  String get typeMessage;

  /// No description provided for @earnings.
  ///
  /// In en, this message translates to:
  /// **'Earnings'**
  String get earnings;

  /// No description provided for @transactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get transactions;

  /// No description provided for @completeProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'Complete Profile'**
  String get completeProfileTitle;

  /// No description provided for @fullNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullNameLabel;

  /// No description provided for @titleLabel.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get titleLabel;

  /// No description provided for @monthlyRateLabel.
  ///
  /// In en, this message translates to:
  /// **'Monthly Rate'**
  String get monthlyRateLabel;

  /// No description provided for @addSkillLabel.
  ///
  /// In en, this message translates to:
  /// **'Add Skill'**
  String get addSkillLabel;

  /// No description provided for @saveChangesButton.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChangesButton;

  /// No description provided for @findYourNextProject.
  ///
  /// In en, this message translates to:
  /// **'Find Your Next Project'**
  String get findYourNextProject;

  /// No description provided for @searchPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Search project...'**
  String get searchPlaceholder;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @uiuxDesign.
  ///
  /// In en, this message translates to:
  /// **'UI/UX Design'**
  String get uiuxDesign;

  /// No description provided for @webDevelopment.
  ///
  /// In en, this message translates to:
  /// **'Web Development'**
  String get webDevelopment;

  /// No description provided for @mobileAppDesign.
  ///
  /// In en, this message translates to:
  /// **'Mobile App Design'**
  String get mobileAppDesign;

  /// No description provided for @noResultsFound.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResultsFound;

  /// No description provided for @experienceLevel.
  ///
  /// In en, this message translates to:
  /// **'Experience Level'**
  String get experienceLevel;

  /// No description provided for @proposalSentTitle.
  ///
  /// In en, this message translates to:
  /// **'Proposal Sent!'**
  String get proposalSentTitle;

  /// No description provided for @proposalSentSuccess.
  ///
  /// In en, this message translates to:
  /// **'Your proposal has been submitted successfully.'**
  String get proposalSentSuccess;

  /// No description provided for @proposalSentNotify.
  ///
  /// In en, this message translates to:
  /// **'The client will be notified and you\'ll hear back if they\'re interested.'**
  String get proposalSentNotify;

  /// No description provided for @viewMyProposals.
  ///
  /// In en, this message translates to:
  /// **'View My Proposals'**
  String get viewMyProposals;

  /// No description provided for @backToJob.
  ///
  /// In en, this message translates to:
  /// **'Back to Job'**
  String get backToJob;

  /// No description provided for @rateClient.
  ///
  /// In en, this message translates to:
  /// **'Rate Client'**
  String get rateClient;

  /// No description provided for @rateExperience.
  ///
  /// In en, this message translates to:
  /// **'How was your experience working with {name}?'**
  String rateExperience(String name);

  /// No description provided for @writeReview.
  ///
  /// In en, this message translates to:
  /// **'Write a review'**
  String get writeReview;

  /// No description provided for @optional.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optional;

  /// No description provided for @submitReview.
  ///
  /// In en, this message translates to:
  /// **'Submit Review'**
  String get submitReview;

  /// No description provided for @yourProposal.
  ///
  /// In en, this message translates to:
  /// **'Your Proposal'**
  String get yourProposal;

  /// No description provided for @bidAmount.
  ///
  /// In en, this message translates to:
  /// **'Bid Amount'**
  String get bidAmount;

  /// No description provided for @deliveryTime.
  ///
  /// In en, this message translates to:
  /// **'Delivery Time'**
  String get deliveryTime;

  /// No description provided for @attachments.
  ///
  /// In en, this message translates to:
  /// **'Attachments'**
  String get attachments;

  /// No description provided for @writeProposalHint.
  ///
  /// In en, this message translates to:
  /// **'Write your proposal here...'**
  String get writeProposalHint;

  /// No description provided for @file.
  ///
  /// In en, this message translates to:
  /// **'File'**
  String get file;

  /// No description provided for @submitWork.
  ///
  /// In en, this message translates to:
  /// **'Submit Work'**
  String get submitWork;

  /// No description provided for @milestone.
  ///
  /// In en, this message translates to:
  /// **'Milestone'**
  String get milestone;

  /// No description provided for @deliverables.
  ///
  /// In en, this message translates to:
  /// **'Deliverables'**
  String get deliverables;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @submitForReview.
  ///
  /// In en, this message translates to:
  /// **'Submit For Review'**
  String get submitForReview;

  /// No description provided for @addMoreFiles.
  ///
  /// In en, this message translates to:
  /// **'Add More Files'**
  String get addMoreFiles;

  /// No description provided for @workApprovedTitle.
  ///
  /// In en, this message translates to:
  /// **'Work Approved!'**
  String get workApprovedTitle;

  /// No description provided for @workApprovedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Your work has been approved successfully.'**
  String get workApprovedSuccess;

  /// No description provided for @addedToBalance.
  ///
  /// In en, this message translates to:
  /// **'The payment has been added to your balance.'**
  String get addedToBalance;

  /// No description provided for @viewPayment.
  ///
  /// In en, this message translates to:
  /// **'View Payment'**
  String get viewPayment;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @messages.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get messages;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @allTab.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allTab;

  /// No description provided for @unreadTab.
  ///
  /// In en, this message translates to:
  /// **'Unread'**
  String get unreadTab;

  /// No description provided for @mentionTab.
  ///
  /// In en, this message translates to:
  /// **'Mention'**
  String get mentionTab;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @walletTab.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get walletTab;

  /// No description provided for @manageEverything.
  ///
  /// In en, this message translates to:
  /// **'Manage everything in one place'**
  String get manageEverything;

  /// No description provided for @currentBalance.
  ///
  /// In en, this message translates to:
  /// **'Current Balance'**
  String get currentBalance;

  /// No description provided for @addFunds.
  ///
  /// In en, this message translates to:
  /// **'Add Funds'**
  String get addFunds;

  /// No description provided for @safeSecure.
  ///
  /// In en, this message translates to:
  /// **'100% Safe & secure'**
  String get safeSecure;

  /// No description provided for @multiplePaymentMethods.
  ///
  /// In en, this message translates to:
  /// **'Multiple payment methods'**
  String get multiplePaymentMethods;

  /// No description provided for @securePayments.
  ///
  /// In en, this message translates to:
  /// **'Secure Payments'**
  String get securePayments;

  /// No description provided for @projectHistory.
  ///
  /// In en, this message translates to:
  /// **'Project History'**
  String get projectHistory;

  /// No description provided for @allProjectsCount.
  ///
  /// In en, this message translates to:
  /// **'All Projects({count})'**
  String allProjectsCount(int count);

  /// No description provided for @inProgressCount.
  ///
  /// In en, this message translates to:
  /// **'In Progress({count})'**
  String inProgressCount(int count);

  /// No description provided for @completedCount.
  ///
  /// In en, this message translates to:
  /// **'Completed({count})'**
  String completedCount(int count);

  /// No description provided for @acceptCount.
  ///
  /// In en, this message translates to:
  /// **'Accept({count})'**
  String acceptCount(int count);

  /// No description provided for @declinedCount.
  ///
  /// In en, this message translates to:
  /// **'Decline({count})'**
  String declinedCount(int count);

  /// No description provided for @proposedOn.
  ///
  /// In en, this message translates to:
  /// **'Proposed on {date}'**
  String proposedOn(String date);

  /// No description provided for @lastUpdate.
  ///
  /// In en, this message translates to:
  /// **'Last Update'**
  String get lastUpdate;

  /// No description provided for @rejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get rejected;

  /// No description provided for @invited.
  ///
  /// In en, this message translates to:
  /// **'Invited'**
  String get invited;

  /// No description provided for @accepted.
  ///
  /// In en, this message translates to:
  /// **'Accepted'**
  String get accepted;

  /// No description provided for @declined.
  ///
  /// In en, this message translates to:
  /// **'Declined'**
  String get declined;

  /// No description provided for @budget.
  ///
  /// In en, this message translates to:
  /// **'Budget'**
  String get budget;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

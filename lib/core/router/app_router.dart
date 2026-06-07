import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/features/auth/presentation/views/login_screen.dart';
import 'package:dipe_freelance/features/auth/presentation/views/signup_screen.dart';
import 'package:dipe_freelance/features/client/present/screen/create_contract_screen.dart';
import 'package:dipe_freelance/features/client/present/screen/freelance_dashboard_screen.dart';
import 'package:dipe_freelance/features/client/present/screen/milestone_review_screen.dart';
import 'package:dipe_freelance/features/client/present/screen/project_details_screen.dart';
import 'package:dipe_freelance/features/client/present/screen/project_progress_screen.dart';
import 'package:dipe_freelance/features/client/present/screen/release_payment_screen.dart';
import 'package:dipe_freelance/features/client/present/screen/user_dashboard_screen.dart';
import 'package:dipe_freelance/features/on_boarding/presentation/screen/on_boarding_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.onBoarding,
    routes: [
      GoRoute(
        path: AppRoutes.onBoarding,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.signup,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: AppRoutes.freelanceDashboard,
        builder: (context, state) => const FreelanceDashboardView(),
      ),
      GoRoute(
        path: AppRoutes.userDashboard,
        builder: (context, state) => const UserDashboardView(),
      ),
      GoRoute(
        path: AppRoutes.projectDetails,
        builder: (context, state) => const ProjectDetailsPage(),
      ),
      GoRoute(
        path: AppRoutes.createContract,
        builder: (context, state) => const CreateContractScreen(),
      ),
      GoRoute(
        path: AppRoutes.milestoneReview,
        builder: (context, state) => const MilestoneReviewScreen(),
      ),

      GoRoute(
        path: AppRoutes.releasePayment,
        builder: (context, state) => const ReleasePaymentScreen(),
      ),
      GoRoute(
        path: AppRoutes.projectProgress,
        builder: (context, state) => const ProjectProgressScreen(),
      ),
    ],
  );
}

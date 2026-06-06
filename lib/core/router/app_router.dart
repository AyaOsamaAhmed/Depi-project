import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/features/auth/presentation/views/login_screen.dart';
import 'package:dipe_freelance/features/auth/presentation/views/signup_screen.dart';
import 'package:dipe_freelance/features/client/presentation%20/screen/freelance_dashboard_screen.dart';
import 'package:dipe_freelance/features/client/presentation%20/screen/project_details_screen.dart';
import 'package:dipe_freelance/features/client/presentation%20/screen/user_dashboard_screen.dart';
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
    ],
  );
}

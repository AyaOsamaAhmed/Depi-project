import 'package:dipe_freelance/core/di/injection.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/features/auth/presentation/states/signup/signup_cubit.dart';
import 'package:dipe_freelance/features/auth/presentation/views/choose_role_screen.dart';
import 'package:dipe_freelance/features/auth/presentation/views/forget_password_screen.dart';
import 'package:dipe_freelance/features/auth/presentation/views/login_screen.dart';
import 'package:dipe_freelance/features/auth/presentation/views/signup_screen.dart';
import 'package:dipe_freelance/features/auth/presentation/views/verify_email_screen.dart';
import 'package:dipe_freelance/features/freelance_dashboard/presentation/views/freelance_dashboard_view.dart';
import 'package:dipe_freelance/features/on_boarding/presentation/screen/splash_screen.dart';
import 'package:dipe_freelance/features/user_dashboard/presentation/views/user_dashboard_view.dart';
import 'package:dipe_freelance/features/on_boarding/presentation/screen/on_boarding_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
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
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<SignupCubit>(),
          child: const SignupScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.chooseRole,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return ChooseRoleScreen(
            email: data['email'] ?? '',
            password: data['password'] ?? '',
            firstName: data['firstName'] ?? '',
            lastName: data['lastName'] ?? '',
          );
        },
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
        path: AppRoutes.resetPassword,
        builder: (context, state) => const ForgetPasswordScreen(),
      ),
      GoRoute(
        path: AppRoutes.verifyEmail,
        builder: (context, state) {
          final email = state.extra as String? ?? '';
          return VerifyEmailScreen(email: email);
        },
      ),
    ],
  );
}

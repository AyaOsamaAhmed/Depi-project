import 'package:dipe_freelance/core/di/injection.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/features/auth/presentation/states/signup/signup_cubit.dart';
import 'package:dipe_freelance/features/auth/presentation/views/choose_role_screen.dart';
import 'package:dipe_freelance/features/auth/presentation/views/forget_password_screen.dart';
import 'package:dipe_freelance/features/auth/presentation/views/login_screen.dart';
import 'package:dipe_freelance/features/auth/presentation/views/signup_screen.dart';
import 'package:dipe_freelance/features/client/present/screen/create_contract_screen.dart';
import 'package:dipe_freelance/features/client/present/screen/freelance_dashboard_screen.dart';
import 'package:dipe_freelance/features/client/present/screen/milestone_review_screen.dart';
import 'package:dipe_freelance/features/client/present/screen/price_breakdown_screen.dart';
import 'package:dipe_freelance/features/client/present/screen/project_details_screen.dart';
import 'package:dipe_freelance/features/client/present/screen/project_progress_screen.dart';
import 'package:dipe_freelance/features/client/present/screen/project_publish_screen.dart';
import 'package:dipe_freelance/features/client/present/screen/release_payment_screen.dart';
import 'package:dipe_freelance/features/client/present/screen/project_live_screen.dart';
import 'package:dipe_freelance/features/client/present/screen/user_dashboard_screen.dart';
import 'package:dipe_freelance/features/client/present/screen/create_new_project_screen.dart';
import 'package:dipe_freelance/features/client/present/states/contract_cubit.dart';
import 'package:dipe_freelance/features/on_boarding/presentation/screen/on_boarding_screen.dart';
import 'package:dipe_freelance/features/on_boarding/presentation/screen/splash_screen.dart';
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
        path: AppRoutes.userDashboard,
        builder: (context, state) => const UserDashboardScreen(),
      ),
      GoRoute(
        path: AppRoutes.createNewProject,
        builder: (context, state) => const CreateNewProjectScreen(),
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
        path: AppRoutes.projectPublish,
        builder: (context, state) => const ProjectPublishScreen(),
      ),
      GoRoute(
        path: AppRoutes.projectLive,
        builder: (context, state) => const ProjectLiveScreen(),
      ),
      GoRoute(
        path: AppRoutes.projectDetails,
        builder: (context, state) => const ProjectDetailsPage(),
      ),
      GoRoute(
        path: AppRoutes.createContract,
        builder: (context, state) => BlocProvider(
          create: (_) => ContractCubit()..loadContract(),
          child: const CreateContractScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.projectProgress,
        builder: (context, state) => BlocProvider(
          create: (_) => ContractCubit()..loadContract(),
          child: const ProjectProgressScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.milestoneReview,
        builder: (context, state) => BlocProvider(
          create: (_) => ContractCubit()..loadContract(),
          child: const MilestoneReviewScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.releasePayment,
        builder: (context, state) => BlocProvider(
          create: (_) => ContractCubit()..loadContract(),
          child: const ReleasePaymentScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.priceBreakdown,
        builder: (context, state) => const PriceBreakdownScreen(),
      ),
    ],
  );
}

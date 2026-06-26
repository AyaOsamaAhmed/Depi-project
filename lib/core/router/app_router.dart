import 'package:flutter/material.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/features/auth/presentation/views/login_screen.dart';
import 'package:dipe_freelance/features/auth/presentation/views/signup_screen.dart';
import 'package:dipe_freelance/features/user_dashboard/presentation/views/user_dashboard_view.dart';
import 'package:dipe_freelance/features/on_boarding/presentation/screen/on_boarding_screen.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/finish_project_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/funds_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/home_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/invite_recieved_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/job_detalis.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/chat_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/message_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/notification_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/navbar.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/payment_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/profile_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/project_workspace_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/projects_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/proposal_send_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/rate_client_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/submit_proposal_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/submit_work_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/work_approved_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/project_history_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static String initialRoute = AppRoutes.freelanceDashboard;

  static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: initialRoute,
    navigatorKey: _rootNavigatorKey,
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
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return FreelancerNavbar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                builder: (context, state) => const HomeView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.projects,
                builder: (context, state) => const ProjectsView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.projectHistory,
                builder: (context, state) => const ProjectHistoryView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.messages,
                builder: (context, state) => const MessageView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                builder: (context, state) => const FreelancerProfileView(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.freelanceDashboard,
        redirect: (context, state) => AppRoutes.home,
      ),
      GoRoute(
        path: AppRoutes.userDashboard,
        builder: (context, state) => const UserDashboardView(),
      ),
      GoRoute(
        path: AppRoutes.finishProject,
        builder: (context, state) => const FinishProjectView(),
      ),
      GoRoute(
        path: AppRoutes.funds,
        builder: (context, state) => const FundsView(),
      ),
      GoRoute(
        path: AppRoutes.inviteReceived,
        builder: (context, state) => const InviteRecievedView(),
      ),
      GoRoute(
        path: AppRoutes.jobDetails,
        builder: (context, state) => const JobDetailsView(),
      ),
      GoRoute(
        path: AppRoutes.chat,
        builder: (context, state) => const ChatView(),
      ),
      GoRoute(
        path: AppRoutes.notifications,
        builder: (context, state) => const NotificationView(),
      ),
      GoRoute(
        path: AppRoutes.payment,
        builder: (context, state) => const PaymentView(),
      ),
      GoRoute(
        path: AppRoutes.projectWorkspace,
        builder: (context, state) => const ProjectWorkspaceView(),
      ),
      GoRoute(
        path: AppRoutes.proposalSend,
        builder: (context, state) => const ProposalSendView(),
      ),
      GoRoute(
        path: AppRoutes.rateClient,
        builder: (context, state) => const RateClientView(),
      ),
      GoRoute(
        path: AppRoutes.submitProposal,
        builder: (context, state) => const SubmitProposalView(),
      ),
      GoRoute(
        path: AppRoutes.submitWork,
        builder: (context, state) => const SubmitWorkView(),
      ),
      GoRoute(
        path: AppRoutes.workApproved,
        builder: (context, state) => const WorkApprovedView(),
      ),
    ],
  );
}

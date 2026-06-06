import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/features/auth/presentation/views/login_screen.dart';
import 'package:dipe_freelance/features/auth/presentation/views/signup_screen.dart';
import 'package:dipe_freelance/features/freelance_dashboard/presentation/views/freelance_dashboard_view.dart';
import 'package:dipe_freelance/features/user_dashboard/presentation/views/user_dashboard_view.dart';
import 'package:dipe_freelance/features/on_boarding/presentation/screen/on_boarding_screen.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/analysitcs_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/finish_project_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/funds_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/home_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/invite_recieved_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/job_detalis.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/massege_chat_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/payment_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/profile_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/project_workspace_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/projects_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/proposal_send_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/rate_client_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/submit_proposal_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/submit_work_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/work_approved_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.freelanceDashboard,
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
        path: AppRoutes.analytics,
        builder: (context, state) => const AnalysitcsView(),
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
        path: AppRoutes.home,
        builder: (context, state) => const HomeView(),
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
        path: AppRoutes.messageChat,
        builder: (context, state) => const MessageChatView(),
      ),
      GoRoute(
        path: AppRoutes.payment,
        builder: (context, state) => const PaymentView(),
      ),
      GoRoute(
        path: AppRoutes.profile,
        builder: (context, state) => const FreelancerProfileView(),
      ),
      GoRoute(
        path: AppRoutes.projectWorkspace,
        builder: (context, state) => const ProjectWorkspaceView(),
      ),
      GoRoute(
        path: AppRoutes.projects,
        builder: (context, state) => const ProjectsView(),
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

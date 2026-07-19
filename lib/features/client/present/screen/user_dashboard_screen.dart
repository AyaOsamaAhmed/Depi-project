import 'package:dipe_freelance/core/di/injection.dart';
import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/features/client/present/states/user_dashboard_cubit.dart';
import 'package:dipe_freelance/features/client/present/states/user_dashboard_state.dart';
import 'package:dipe_freelance/features/client/present/widgets/shared_blue_button.dart';
import 'package:dipe_freelance/features/client/present/widgets/total_spent_card.dart';
import 'package:dipe_freelance/features/client/present/widgets/active_projects_row.dart';
import 'package:dipe_freelance/features/client/present/widgets/recent_project_item.dart';
import 'package:dipe_freelance/features/client/domain/entities/project_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'create_new_project_screen.dart';

class UserDashboardScreen extends StatelessWidget {
  const UserDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UserDashboardCubit>()..loadDashboard(),
      child: Scaffold(
        backgroundColor: context.colorScheme.surface,
        body: const _UserDashboardBody(),
      ),
    );
  }
}

class _UserDashboardBody extends StatelessWidget {
  const _UserDashboardBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDashboardCubit, UserDashboardState>(
      builder: (context, state) {
        if (state is UserDashboardLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is UserDashboardSuccess) {
          return _buildContent(context, state);
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildContent(BuildContext context, UserDashboardSuccess state) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16.w, 56.h, 16.w, 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: context.colorScheme.surface,
                      borderRadius: BorderRadius.circular(8.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.menu,
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    'Hello, ${state.userName} 👋',
                    style: context.textTheme.titleLarge?.copyWith(
                      color: context.colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                radius: 22.r,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person, color: context.colorScheme.surface),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          TotalSpentCard(
            totalSpent: state.totalSpent,
            monthlyChange: state.monthlyChange,
          ),
          SizedBox(height: 20.h),
          Text(
            'Active Projects',
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12.h),
          ActiveProjectsRow(
            inProgress: state.inProgress,
            completed: state.completed,
            pending: state.pending,
          ),
          SizedBox(height: 20.h),
          Text(
            'Recent Projects',
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.recentProjects.length,
              separatorBuilder: (_, __) => Divider(height: 1.h),
              itemBuilder: (context, index) =>
                  RecentProjectItem(project: state.recentProjects[index]),
            ),
          ),
          SizedBox(height: 24.h),
          SharedBlueButton(
            text: '+ Create Projects',
            onPressed: () => context.push(AppRoutes.createNewProject),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}


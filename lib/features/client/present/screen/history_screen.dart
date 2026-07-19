import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/core/theme/app_colors.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/core/di/injection.dart';
import 'package:dipe_freelance/features/client/present/states/history_cubit.dart';
import 'package:dipe_freelance/features/client/present/states/history_state.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ClientHistoryCubit>()..loadHistory(),
      child: const HistoryView(),
    );
  }
}

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<ClientHistoryItem> _getFilteredProjects(List<ClientHistoryItem> allProjects, int tabIndex) {
    switch (tabIndex) {
      case 1: // In Progress
        return allProjects.where((p) => p.status == 'In Progress').toList();
      case 2: // Completed
        return allProjects.where((p) => p.status == 'Completed').toList();
      case 3: // Accept (Invited, Accepted, Rejected)
        return allProjects
            .where((p) =>
                p.status == 'Accepted' ||
                p.status == 'Invited' ||
                p.status == 'Rejected')
            .toList();
      case 0: // All Projects
      default:
        return allProjects;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientHistoryCubit, ClientHistoryState>(
      builder: (context, state) {
        if (state is ClientHistoryLoading) {
          return const Scaffold(
            backgroundColor: Color(0xFFF8F9FE),
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is ClientHistorySuccess) {
          final allProjects = state.projects;
          final int allCount = allProjects.length;
          final int inProgressCount = allProjects.where((p) => p.status == 'In Progress').length;
          final int completedCount = allProjects.where((p) => p.status == 'Completed').length;
          final int acceptCount = allProjects.where((p) => p.status == 'Accepted' || p.status == 'Invited').length;

          return Scaffold(
            backgroundColor: const Color(0xFFF8F9FE),
            appBar: AppBar(
              backgroundColor: const Color(0xFFF8F9FE),
              elevation: 0,
              surfaceTintColor: Colors.transparent,
              leading: Padding(
                padding: EdgeInsets.only(left: 12.w),
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black, size: 24.r),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              title: Text(
                context.local.projectHistory,
                style: context.textTheme.headlineMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp,
                ),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                SizedBox(height: 12.h),
                // Tab Bar
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                    height: 48.h,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFFE5E7EB),
                          width: 2,
                        ),
                      ),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      dividerColor: Colors.transparent,
                      indicatorColor: AppColors.primary700,
                      indicatorWeight: 3.h,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: AppColors.primary700,
                      unselectedLabelColor: Colors.grey[500],
                      labelStyle: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter',
                      ),
                      tabs: [
                        Tab(text: context.local.allProjectsCount(allCount)),
                        Tab(text: context.local.inProgressCount(inProgressCount)),
                        Tab(text: context.local.completedCount(completedCount)),
                        Tab(text: context.local.acceptCount(acceptCount)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                // Tab Bar Views
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _ProjectsListView(projects: _getFilteredProjects(allProjects, 0)),
                      _ProjectsListView(projects: _getFilteredProjects(allProjects, 1)),
                      _ProjectsListView(projects: _getFilteredProjects(allProjects, 2)),
                      _ProjectsListView(projects: _getFilteredProjects(allProjects, 3)),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        if (state is ClientHistoryError) {
          return Scaffold(
            backgroundColor: const Color(0xFFF8F9FE),
            body: Center(child: Text(state.message)),
          );
        }
        return const Scaffold(
          backgroundColor: Color(0xFFF8F9FE),
          body: Center(child: SizedBox.shrink()),
        );
      },
    );
  }
}

class _ProjectsListView extends StatelessWidget {
  final List<ClientHistoryItem> projects;

  const _ProjectsListView({required this.projects});

  @override
  Widget build(BuildContext context) {
    if (projects.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.work_off_outlined,
              size: 64.r,
              color: Colors.grey[400],
            ),
            SizedBox(height: 16.h),
            Text(
              context.local.noResultsFound,
              style: context.textTheme.bodyLarge?.copyWith(
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return _ProjectHistoryCard(project: projects[index]);
      },
    );
  }
}

class _ProjectHistoryCard extends StatelessWidget {
  final ClientHistoryItem project;

  const _ProjectHistoryCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.015),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Icon Container
              Container(
                width: 56.r,
                height: 56.r,
                decoration: BoxDecoration(
                  color: AppColors.secondary200,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Icon(
                    project.icon,
                    color: AppColors.secondary700,
                    size: 28.r,
                  ),
                ),
              ),
              SizedBox(width: 14.w),
              // Middle Title Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.title,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      project.clientName,
                      style: context.textTheme.labelMedium?.copyWith(
                        color: Colors.grey[600],
                        fontSize: 13.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      context.local.proposedOn(project.proposedDate),
                      style: context.textTheme.labelSmall?.copyWith(
                        color: Colors.grey[400],
                        fontSize: 11.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              // Right Status & Chevron
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _StatusBadge(status: project.status),
                      SizedBox(width: 8.w),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: Colors.grey[400],
                        size: 24.r,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
          // Divider & Bottom Stats Row
          Container(
            height: 1.h,
            color: Colors.grey[100],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              // Budget Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.budget,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      context.local.budget,
                      style: context.textTheme.labelSmall?.copyWith(
                        color: Colors.grey[500],
                        fontSize: 11.sp,
                      ),
                    ),
                  ],
                ),
              ),
              // Vertical Divider Line
              Container(
                width: 1.w,
                height: 32.h,
                color: Colors.grey[200],
              ),
              // Last Update Info
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project.lastUpdate,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        context.local.lastUpdate,
                        style: context.textTheme.labelSmall?.copyWith(
                          color: Colors.grey[500],
                          fontSize: 11.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // View Details Button
              ElevatedButton(
                onPressed: () {
                  context.push(AppRoutes.projectDetails);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary700,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  context.local.viewDetails,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    String label;
    switch (status) {
      case 'In Progress':
        color = const Color(0xFF0D2C54);
        label = context.local.inProgress;
        break;
      case 'Rejected':
        color = Colors.red[600]!;
        label = context.local.rejected;
        break;
      case 'Accepted':
        color = Colors.green[600]!;
        label = context.local.accepted;
        break;
      case 'Invited':
        color = Colors.orange[600]!;
        label = context.local.invited;
        break;
      case 'Completed':
        color = Colors.teal[600]!;
        label = status;
        break;
      default:
        color = Colors.grey[600]!;
        label = status;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: color, width: 1.w),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 10.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

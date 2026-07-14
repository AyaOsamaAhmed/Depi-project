import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/project_history_cubit.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/project_history_state.dart';
import 'package:dipe_freelance/core/di/injection.dart';
import 'package:go_router/go_router.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';

class ProjectHistoryView extends StatelessWidget {
  const ProjectHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProjectHistoryCubit>(),
      child: Scaffold(
        backgroundColor: context.colorScheme.surface,
        appBar: AppBar(
          backgroundColor: context.colorScheme.surface,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          centerTitle: true,
          title: Text(
            context.local.projectHistory,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: const _ProjectHistoryBody(),
      ),
    );
  }
}

class _ProjectHistoryBody extends StatefulWidget {
  const _ProjectHistoryBody();

  @override
  State<_ProjectHistoryBody> createState() => _ProjectHistoryBodyState();
}

class _ProjectHistoryBodyState extends State<_ProjectHistoryBody> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    context.read<ProjectHistoryCubit>().fetchHistory();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectHistoryCubit, ProjectHistoryState>(
      builder: (context, state) {
        final List<ProjectHistoryModel> projects = state is ProjectHistoryLoaded ? state.projects : [];
        
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                dividerColor: Colors.transparent,
                indicatorColor: AppColors.primary700,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: AppColors.primary700,
                unselectedLabelColor: Colors.grey,
                labelStyle: context.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
                unselectedLabelStyle: context.textTheme.labelMedium,
                tabs: [
                  Tab(text: context.local.allProjectsCount(projects.length)),
                  Tab(text: context.local.inProgressCount(projects.where((p) => p.status == 'In Progress').length)),
                  Tab(text: context.local.completedCount(projects.where((p) => p.status == 'Completed').length)),
                  Tab(text: context.local.acceptCount(projects.where((p) => p.status == 'Accepted').length)),
                  Tab(text: context.local.declinedCount(projects.where((p) => p.status == 'Declined').length)),
                ],
              ),
            ),
            Expanded(
              child: state is ProjectHistoryLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state is ProjectHistoryLoaded
                      ? TabBarView(
                          controller: _tabController,
                          children: [
                            _ProjectsList(projects: state.projects),
                            _ProjectsList(projects: state.projects.where((p) => p.status == 'In Progress').toList()),
                            _ProjectsList(projects: state.projects.where((p) => p.status == 'Completed').toList()),
                            _ProjectsList(projects: state.projects.where((p) => p.status == 'Accepted').toList()),
                            _ProjectsList(projects: state.projects.where((p) => p.status == 'Declined').toList()),
                          ],
                        )
                      : const SizedBox(),
            ),
          ],
        );
      },
    );
  }
}

class _ProjectsList extends StatelessWidget {
  final List<ProjectHistoryModel> projects;

  const _ProjectsList({required this.projects});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(20.w),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return _ProjectCard(project: projects[index]);
      },
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final ProjectHistoryModel project;

  const _ProjectCard({required this.project});

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
            color: Colors.black.withOpacity(0.02),
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
              Container(
                width: 60.r,
                height: 60.r,
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE5D0),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  _getIconForTitle(project.title),
                  color: const Color(0xFFE67E22),
                  size: 32.r,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            project.title,
                            style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (project.status == 'Invited') {
                              context.push(AppRoutes.inviteReceived);
                            }
                          },
                          child: _StatusBadge(status: project.status),
                        ),
                        Icon(Icons.chevron_right, color: Colors.grey, size: 24.r),
                      ],
                    ),
                    Text(
                      project.clientName,
                      style: context.textTheme.bodySmall?.copyWith(color: Colors.grey),
                    ),
                    Text(
                      context.local.proposedOn(project.proposedDate),
                      style: context.textTheme.labelSmall?.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _InfoColumn(label: context.local.lastUpdate, value: project.lastUpdate),
              ElevatedButton(
                onPressed: () => context.push(AppRoutes.projectWorkspace),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary700,
                  minimumSize: Size(100.w, 36.h),
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  context.local.viewDetails,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  IconData _getIconForTitle(String title) {
    if (title.contains('Website')) return Icons.shopping_cart_outlined;
    if (title.contains('App')) return Icons.smartphone_rounded;
    return Icons.desktop_mac_outlined;
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
        color = Colors.red;
        label = context.local.rejected;
        break;
      case 'Accepted':
        color = Colors.green;
        label = context.local.accepted;
        break;
      case 'Invited':
        color = Colors.orange;
        label = context.local.invited;
        break;
      case 'Declined':
        color = Colors.red;
        label = context.local.declined;
        break;
      default:
        color = Colors.grey;
        label = status;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        label,
        style: TextStyle(color: color, fontSize: 10.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _InfoColumn extends StatelessWidget {
  final String label;
  final String value;

  const _InfoColumn({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: context.textTheme.labelSmall?.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}

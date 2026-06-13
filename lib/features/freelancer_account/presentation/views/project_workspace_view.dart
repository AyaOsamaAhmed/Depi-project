import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/project_cubit.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/project_state.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:go_router/go_router.dart';

import 'package:dipe_freelance/core/di/injection.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/project_history_cubit.dart';

class ProjectWorkspaceView extends StatefulWidget {
  const ProjectWorkspaceView({super.key});

  @override
  State<ProjectWorkspaceView> createState() => _ProjectWorkspaceViewState();
}

class _ProjectWorkspaceViewState extends State<ProjectWorkspaceView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ProjectCubit>()),
        BlocProvider(create: (context) => getIt<ProjectHistoryCubit>()),
      ],
      child: BlocBuilder<ProjectCubit, ProjectState>(
      builder: (context, state) {
        if (state is ProjectLoading) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        return Scaffold(
          backgroundColor: context.colorScheme.surface,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          'E-commerce Website UI',
                          style: context.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 22.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTag(context.local.fixedPrices),
                        SizedBox(height: 24.h),
                        _buildSectionHeader(context.local.projectOverview),
                        SizedBox(height: 12.h),
                        Text(
                          'Design a modern e-commerce website with homepage, product page, cart, and checkout.',
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.colorScheme.onSurface.withOpacity(0.8),
                            height: 1.5,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 32.h),
                        _buildSectionHeader(context.local.milestones),
                        SizedBox(height: 16.h),
                        _buildMilestonesList(context),
                        SizedBox(height: 32.h),
                        _buildSectionHeader(context.local.projectFiles),
                        SizedBox(height: 16.h),
                        _buildFileItem(context, 'Prief.pdf'),
                        SizedBox(height: 32.h),
                        _buildSubmitButton(context),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      ),
    );
  }


  Widget _buildTag(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE5D0),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: const Color(0xFFE67E22),
          fontSize: 10.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: context.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 18.sp,
      ),
    );
  }

  Widget _buildMilestonesList(BuildContext context) {
    return Container(
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
          _buildMilestoneItem(
            context,
            'Mobile App Design',
            context.local.inProgress,
            '\$1,500',
            const Color(0xFF38B880),
          ),
          _buildDivider(),
          _buildMilestoneItem(
            context,
            'Mobile App Design',
            context.local.inProgress,
            '\$1,500',
            const Color(0xFF38B880),
          ),
          _buildDivider(),
          _buildMilestoneItem(
            context,
            'Website Development',
            context.local.pending,
            '\$750',
            const Color(0xFFF04438),
          ),
        ],
      ),
    );
  }

  Widget _buildMilestoneItem(
    BuildContext context,
    String title,
    String status,
    String price,
    Color statusColor,
  ) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: const Color(0xFFFFE5D0),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              title.contains('Mobile') ? Icons.architecture_rounded : Icons.web_rounded,
              color: const Color(0xFFE67E22),
              size: 28.r,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  status,
                  style: TextStyle(
                    color: statusColor.withOpacity(0.6),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Text(
            price,
            style: context.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Divider(height: 1, color: Colors.grey.withOpacity(0.1)),
    );
  }

  Widget _buildFileItem(BuildContext context, String fileName) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: const Color(0xFFFFE5D0),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              Icons.insert_drive_file_outlined,
              color: const Color(0xFFE67E22),
              size: 24.r,
            ),
          ),
          SizedBox(width: 16.w),
          Text(
            fileName,
            style: context.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.push(AppRoutes.submitWork);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF0D2C54),
        minimumSize: Size(double.infinity, 56.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        elevation: 0,
      ),
      child: Text(
        context.local.submitWork,
        style: context.textTheme.titleMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
        ),
      ),
    );
  }
}

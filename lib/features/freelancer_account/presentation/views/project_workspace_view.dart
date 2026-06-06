import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/project_cubit.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/project_state.dart';

class ProjectWorkspaceView extends StatefulWidget {
  const ProjectWorkspaceView({super.key});

  @override
  State<ProjectWorkspaceView> createState() => _ProjectWorkspaceViewState();
}

class _ProjectWorkspaceViewState extends State<ProjectWorkspaceView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectCubit, ProjectState>(
      builder: (context, state) {
        if (state is ProjectLoading) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        return Scaffold(
          backgroundColor: context.colorScheme.surface,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'E-commerce Website UI',
                          style: context.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.sp,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        _buildTag(context.local.fixedPrices),
                        SizedBox(height: 32.h),
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
                      ],
                    ),
                  ),
                ),
                _buildBottomNavigationBar(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.secondary200,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: AppColors.secondary700,
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
      padding: EdgeInsets.all(20.r),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: AppColors.secondary200.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              title.contains('Mobile') ? Icons.architecture_rounded : Icons.web_rounded,
              color: AppColors.secondary700,
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
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Divider(height: 1, color: Colors.grey.withOpacity(0.1)),
    );
  }

  Widget _buildFileItem(BuildContext context, String fileName) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: context.colorScheme.onSurface.withOpacity(0.04),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: context.colorScheme.onSurface.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: AppColors.secondary200.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              Icons.insert_drive_file_outlined,
              color: AppColors.secondary700,
              size: 24.r,
            ),
          ),
          SizedBox(width: 16.w),
          Text(
            fileName,
            style: context.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.1))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(0, context.local.milestones),
          _buildNavItem(1, context.local.workshop),
          _buildNavItem(2, 'Files'),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String label) {
    bool isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? const Color(0xFF0B2647) : Colors.grey,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}

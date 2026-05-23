import 'package:dipe_freelance/core/di/injection.dart';
import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/features/freelance_dashboard/presentation/states/freelance_dashboard_state.dart';
import 'package:dipe_freelance/features/freelance_dashboard/presentation/widgets/shared_blue_button.dart';
import 'package:dipe_freelance/features/freelance_dashboard/presentation/widgets/shared_white_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../states/freelance_dashboard_cubit.dart';

class FreelanceDashboardView extends StatelessWidget {
  const FreelanceDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FreelanceDashboardCubit>(),
      child: Scaffold(
        backgroundColor: context.colorScheme.surface,
        appBar: AppBar(
          backgroundColor: context.colorScheme.surface,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: context.colorScheme.onSurface,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: Text(
            context.local.freelancerProfile,
            style: context.textTheme.headlineMedium?.copyWith(
              color: context.colorScheme.onSurface,
              //fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: const _FreelanceDashboardBody(),
        bottomNavigationBar: const _FreelanceDashboardFooter(),
      ),
    );
  }
}

class _FreelanceDashboardBody extends StatelessWidget {
  const _FreelanceDashboardBody();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header section
          Center(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 35.r,
                  backgroundColor: context.colorScheme.primary.withOpacity(0.1),
                  child: Icon(
                    Icons.person,
                    size: 30.r,
                    color: context.colorScheme.primary,
                  ),
                ),
                Spacer(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Manuella Beshara', // Hardcoded as per design mockup, usually from model
                      style: context.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //  SizedBox(height: 4.h),
                    Text(
                      'UI/UX Designer',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    '96% Match',
                    style: context.textTheme.labelSmall?.copyWith(
                      color: Colors.green[800],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32.h),

          // Stats Card
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            decoration: BoxDecoration(
              color: context.colorScheme.onSecondary,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _StatItem(label: context.local.rating, value: '4.9'),
                Container(
                  width: 1.w,
                  height: 40.h,
                  color: context.colorScheme.onSurface,
                ),
                _StatItem(label: context.local.projects, value: '120'),
                Container(
                  width: 1.w,
                  height: 40.h,
                  color: context.colorScheme.onSurface,
                ),
                _StatItem(label: context.local.earned, value: '\$10k+'),
              ],
            ),
          ),
          SizedBox(height: 32.h),

          // About Section
          Text(
            context.local.about,
            style: context.textTheme.headlineMedium?.copyWith(
              // fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'Experienced UIUX designer with 5+ years of creating user modern designs',
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.primary,
              height: 1.5,
            ),
          ),
          SizedBox(height: 32.h),

          // Skills Section
          Text(
            context.local.skills,
            style: context.textTheme.headlineMedium?.copyWith(
              //   fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          Wrap(
            spacing: 12.w,
            runSpacing: 12.h,
            children: [
              _SkillChip(label: 'UI/UX'),
              _SkillChip(label: 'Figma'),
              _SkillChip(label: 'Adobe XD'),
              _SkillChip(label: 'Photoshop'),
            ],
          ),
          SizedBox(height: 32.h),

          // Profile (Portfolio) Section
          Text(
            context.local.profile,
            style: context.textTheme.headlineMedium?.copyWith(
              //fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 140.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              separatorBuilder: (context, index) => SizedBox(width: 16.w),
              itemBuilder: (context, index) {
                return Container(
                  width: 180.w,
                  decoration: BoxDecoration(
                    color: context.colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.web,
                      size: 40.r,
                      color: context.colorScheme.primary.withOpacity(0.5),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: context.textTheme.headlineSmall?.copyWith(
            // fontWeight: FontWeight.bold,
            color: context.colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: context.textTheme.labelMedium?.copyWith(
            color: context.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;

  const _SkillChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: context.colorScheme.onSurface.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        label,
        style: context.textTheme.labelMedium?.copyWith(
          color: context.colorScheme.onSurface,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _FreelanceDashboardFooter extends StatelessWidget {
  const _FreelanceDashboardFooter();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            BlocConsumer<FreelanceDashboardCubit, FreelanceDashboardState>(
              listener: (context, state) {
                // Navigate on success
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(content: Text(context.local.message)),
                  );
                //  context.go(AppRoutes.login);
              },
              builder: (context, state) {
                return Expanded(
                  child: SharedWhiteButton(
                    text: context.local.message,
                    onPressed: () {},
                  ),
                );
              },
            ),

            SizedBox(width: 16.w),

            BlocConsumer<FreelanceDashboardCubit, FreelanceDashboardState>(
              listener: (context, state) {
                // Navigate on success
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(content: Text(context.local.message)),
                  );
                //  context.go(AppRoutes.login);
              },
              builder: (context, state) {
                return Expanded(
                  child: SharedButton(
                    text: context.local.hireFreelancer,
                    onPressed: () {},
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

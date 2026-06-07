import 'package:dipe_freelance/core/di/injection.dart';
import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/features/client/present/widgets/shared_blue_button.dart';
import 'package:dipe_freelance/features/client/present/widgets/shared_white_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../states/user_dashboard_cubit.dart';

class UserDashboardView extends StatelessWidget {
  const UserDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserDashboardCubit>(),
      child: Scaffold(
        backgroundColor: context.colorScheme.surface,
        appBar: AppBar(
          backgroundColor: context.colorScheme.surface,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: context.colorScheme.onSurface),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: const _UserDashboardBody(),
        bottomNavigationBar: const _UserDashboardFooter(),
      ),
    );
  }
}

class _UserDashboardBody extends StatelessWidget {
  const _UserDashboardBody();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/correct_icon.png', fit: BoxFit.fill),
          SizedBox(height: 40.h),

          // Titles
          Text(
            context.local.projectLiveTitle,
            textAlign: TextAlign.center,
            style: context.textTheme.headlineMedium?.copyWith(
              color: context.colorScheme.onSurface,
              //  fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            context.local.projectLiveSubtitle,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurface.withOpacity(0.6),
            ),
          ),

          SizedBox(height: 48.h),

          // What's Next Section
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              context.local.whatsNext,
              style: context.textTheme.headlineSmall?.copyWith(
                color: context.colorScheme.onSurface,
                //   fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 24.h),

          _NextStepItem(text: context.local.createContractMilestone),
          SizedBox(height: 16.h),
          _NextStepItem(text: context.local.workTogetherTrackProgress),
        ],
      ),
    );
  }
}

class _NextStepItem extends StatelessWidget {
  final String text;

  const _NextStepItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/point.png', fit: BoxFit.fill),

        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            text,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurface,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class _UserDashboardFooter extends StatelessWidget {
  const _UserDashboardFooter();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      decoration: BoxDecoration(color: context.colorScheme.surface),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SharedBlueButton(
              text: context.local.viewProject,
              onPressed: () {},
              fontSize: 18.sp,
            ),
            SizedBox(height: 16.h),
            SharedWhiteButton(
              text: context.local.goToDashboard,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

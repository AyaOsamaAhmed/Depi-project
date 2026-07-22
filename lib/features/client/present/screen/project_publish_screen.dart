import 'package:dipe_freelance/core/di/injection.dart';
import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/features/client/present/screen/create_contract_screen.dart';
import 'package:dipe_freelance/features/client/present/states/project_publish_cubit.dart';
import 'package:dipe_freelance/features/client/present/widgets/shared_blue_button.dart';
import 'package:dipe_freelance/features/client/present/widgets/shared_white_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../states/project_live_cubit.dart';

class ProjectPublishScreen extends StatelessWidget {
  const ProjectPublishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProjectPublishCubit>(),
      child: Scaffold(
        backgroundColor: context.colorScheme.surface,
        appBar: AppBar(
          backgroundColor: context.colorScheme.surface,
          title: Text(context.local.projectPublished),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: context.colorScheme.onSurface),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: const _ProjectLiveBody(),
        bottomNavigationBar: const _ProjectLiveFooter(),
      ),
    );
  }
}

class _ProjectLiveBody extends StatelessWidget {
  const _ProjectLiveBody();

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
            context.local.nameHiredForYourProject("Aya Ahmed"),
            textAlign: TextAlign.center,
            style: context.textTheme.headlineMedium?.copyWith(
              color: context.colorScheme.onSurface,
              //  fontWeight: FontWeight.bold,
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

          _NextStepItem(text: context.local.youCanReviewAndHireTheBestFit),
          SizedBox(height: 16.h),
          _NextStepItem(text: context.local.freelanceCanSendProposals),
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

class _ProjectLiveFooter extends StatelessWidget {
  const _ProjectLiveFooter();

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
              text: context.local.createContract,
              onPressed: () {
                context.push(AppRoutes.createContract);
              },
              fontSize: 18.sp,
            ),
            SizedBox(height: 16.h),
            SharedWhiteButton(
              text: context.local.goToProject,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

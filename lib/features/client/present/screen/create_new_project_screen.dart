import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/features/client/present/widgets/shared_blue_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CreateNewProjectScreen extends StatelessWidget {
  const CreateNewProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: context.colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: context.colorScheme.onSurface),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Create New Projects',
          style: context.textTheme.titleLarge?.copyWith(
            color: context.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Column(
          children: [
            const Spacer(),
            // Folder Icon
            Container(
              width: 160.w,
              height: 160.h,
              decoration: BoxDecoration(
                color: context.colorScheme.primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.folder_open_outlined,
                size: 80.sp,
                color: context.colorScheme.primary,
              ),
            ),
            SizedBox(height: 32.h),
            Text(
              "Let's start a new Projects",
              style: context.textTheme.headlineSmall?.copyWith(
                color: context.colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              'Tell us what you need and we well\nhelp you find the best freelancers',
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
            const Spacer(),
            SharedBlueButton(
              text: 'Get Started',
              onPressed: () => context.push(AppRoutes.projectDetails),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}

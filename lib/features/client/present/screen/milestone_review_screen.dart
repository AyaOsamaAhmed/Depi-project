import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/features/client/domain/entities/milestone_entity.dart';
import 'package:dipe_freelance/features/client/present/states/contract_cubit.dart';
import 'package:dipe_freelance/features/client/present/widgets/shared_blue_button.dart';
import 'package:dipe_freelance/features/client/present/widgets/shared_white_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MilestoneReviewScreen extends StatelessWidget {
  final MilestoneEntity? milestone;
  const MilestoneReviewScreen({super.key, this.milestone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: context.colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: context.colorScheme.onSurface),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Milestone Review',
          style: context.textTheme.titleLarge?.copyWith(
            color: context.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Milestone',
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    milestone?.title ?? 'Frontend Development',
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Submitted on',
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        'May 20, 2024',
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Deliverables',
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    decoration: BoxDecoration(
                      color: context.colorScheme.primary.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      children: ['Homepage.html', 'script.js', 'script.js']
                          .map(
                            (file) => ListTile(
                              title: Text(
                                file,
                                style: context.textTheme.bodyMedium?.copyWith(
                                  color: context.colorScheme.primary,
                                ),
                              ),
                              trailing: Icon(
                                Icons.download_outlined,
                                color: context.colorScheme.primary,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Preview',
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    height: 150.h,
                    decoration: BoxDecoration(
                      color: context.colorScheme.primary,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                      child: Text(
                        'Preview Image',
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: context.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Feedback',
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '(Optional)',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Write your feedback here...',
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: context.colorScheme.primary.withOpacity(0.08),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.all(14.w),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 32.h),
            child: Row(
              children: [
                Expanded(
                  child: SharedWhiteButton(
                    text: 'Request Changes',
                    onPressed: () => context.pop(),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: SharedBlueButton(
                    text: 'Approve Work',
                    onPressed: () {
                      context.read<ContractCubit>().releasePayment(
                        freelancerName: 'Aya Ahmed',
                        amount: 500,
                        milestoneTitle:
                            milestone?.title ?? 'Frontend Development',
                      );
                      context.push(AppRoutes.releasePayment);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

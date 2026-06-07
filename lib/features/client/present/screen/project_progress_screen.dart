import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/features/client/domain/entities/contract_entity.dart';
import 'package:dipe_freelance/features/client/domain/entities/milestone_entity.dart';
import 'package:dipe_freelance/features/client/present/states/contract_cubit.dart';
import 'package:dipe_freelance/features/client/present/states/contract_state.dart';
import 'package:dipe_freelance/features/client/present/widgets/shared_blue_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProjectProgressScreen extends StatelessWidget {
  const ProjectProgressScreen({super.key});

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
          'Project Progress',
          style: context.textTheme.titleLarge?.copyWith(
            color: context.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ContractCubit, ContractState>(
        builder: (context, state) {
          if (state is ContractLoaded) {
            return _buildContent(context, state.contract);
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, ContractEntity contract) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Overall Progress',
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${(contract.overallProgress * 100).toInt()}%',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${(contract.overallProgress * 100).toInt()}%',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                LinearProgressIndicator(
                  value: contract.overallProgress,
                  backgroundColor: Colors.grey[300],
                  color: context.colorScheme.primary,
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                SizedBox(height: 24.h),
                Text(
                  'Current Milestones',
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 8.h),
                _buildCurrentMilestone(context, contract.milestones[1]),
                SizedBox(height: 24.h),
                Text(
                  'Milestones',
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 12.h),
                ...contract.milestones.map(
                  (m) => _buildMilestoneItem(context, m),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.w),
          child: SharedBlueButton(
            text: 'Message Freelancer',
            onPressed: () => context.push(AppRoutes.milestoneReview),
          ),
        ),
      ],
    );
  }

  Widget _buildCurrentMilestone(
    BuildContext context,
    MilestoneEntity milestone,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          milestone.title,
          style: context.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 4.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'In Progress\nDue In 5 days',
              style: context.textTheme.bodySmall?.copyWith(color: Colors.grey),
            ),
            Text(
              '${(milestone.progress * 100).toInt()}%',
              style: context.textTheme.bodySmall?.copyWith(color: Colors.grey),
            ),
          ],
        ),
        SizedBox(height: 6.h),
        LinearProgressIndicator(
          value: milestone.progress,
          backgroundColor: Colors.grey[300],
          color: context.colorScheme.primary,
          minHeight: 8,
          borderRadius: BorderRadius.circular(4.r),
        ),
      ],
    );
  }

  Widget _buildMilestoneItem(BuildContext context, MilestoneEntity milestone) {
    final isCompleted = milestone.status == 3;
    final color = isCompleted ? Colors.green : context.colorScheme.primary;

    return GestureDetector(
      onTap: () {
        if (!isCompleted) {
          context.push(AppRoutes.milestoneReview);
        }
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 16.h),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18.r,
              backgroundColor: color,
              child: Icon(Icons.check, color: Colors.white, size: 16.sp),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    milestone.title,
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    isCompleted ? 'Completed' : 'In Progress',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: isCompleted ? Colors.green : Colors.grey,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  LinearProgressIndicator(
                    value: milestone.progress,
                    backgroundColor: Colors.grey[300],
                    color: isCompleted
                        ? Colors.green
                        : context.colorScheme.primary,
                    minHeight: 6,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            Text(
              '${(milestone.progress * 100).toInt()}%',
              style: context.textTheme.bodySmall?.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

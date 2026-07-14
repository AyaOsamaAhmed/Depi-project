import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActiveProjectsRow extends StatelessWidget {
  final int inProgress;
  final int completed;
  final int pending;

  const ActiveProjectsRow({
    super.key,
    required this.inProgress,
    required this.completed,
    required this.pending,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildStatCard(context, inProgress.toString(), 'In Progress'),
        SizedBox(width: 8.w),
        _buildStatCard(context, completed.toString(), 'Completed'),
        SizedBox(width: 8.w),
        _buildStatCard(context, pending.toString(), 'Pending'),
      ],
    );
  }

  Widget _buildStatCard(BuildContext context, String count, String label) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8),
          ],
        ),
        child: Column(
          children: [
            Text(
              count,
              style: context.textTheme.headlineSmall?.copyWith(
                color: const Color(0xFFE07B3A),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: context.textTheme.bodySmall?.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

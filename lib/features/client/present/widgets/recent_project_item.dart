import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/features/client/domain/entities/project_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentProjectItem extends StatelessWidget {
  final ProjectEntity project;

  const RecentProjectItem({super.key, required this.project});

  Color get _statusColor {
    switch (project.status) {
      case 'In Progress':
        return Colors.green;
      case 'Pending':
        return const Color(0xFFE07B3A);
      case 'Completed':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          Container(
            width: 56.w,
            height: 56.h,
            decoration: BoxDecoration(
              color: const Color(0xFFFFE0CC),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: const Icon(
              Icons.design_services_outlined,
              color: Color(0xFFE07B3A),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  project.status,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: _statusColor,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '\$${project.budget.toInt()}',
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

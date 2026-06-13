import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/notifications_cubit.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/notifications_state.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/widgets/notification_item.dart';
import 'package:dipe_freelance/core/di/injection.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NotificationsCubit>()..fetchNotifications(),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: context.colorScheme.surface,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.pop(),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50.h),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: TabBar(
                  indicatorColor: context.colorScheme.primary,
                  indicatorWeight: 4.h,
                  labelColor: context.colorScheme.onSurface,
                  unselectedLabelColor: context.theme.disabledColor,
                  labelStyle: context.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  tabs: [
                    Tab(text: context.local.allTab),
                    Tab(text: context.local.unreadTab),
                    Tab(text: context.local.mentionTab),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              _buildNotificationsList(context),
              _buildNotificationsList(context), // Mocking same list for other tabs
              _buildNotificationsList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationsList(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        if (state is NotificationsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NotificationsSuccess) {
          return ListView.separated(
            padding: EdgeInsets.only(top: 24.h),
            itemCount: state.notifications.length,
            separatorBuilder: (context, index) => Divider(
              indent: 20.w,
              endIndent: 20.w,
              color: context.theme.dividerColor.withOpacity(0.5),
            ),
            itemBuilder: (context, index) {
              final notification = state.notifications[index];
              return NotificationItem(
                title: notification['title']!,
                time: notification['time']!,
              );
            },
          );
        } else if (state is NotificationsError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox.shrink();
      },
    );
  }
}

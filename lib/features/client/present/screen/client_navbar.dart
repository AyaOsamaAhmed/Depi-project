import 'package:flutter/material.dart';
import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:dipe_freelance/core/theme/app_colors.dart';

class ClientNavbar extends StatelessWidget {
  const ClientNavbar({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  void _onItemTapped(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = navigationShell.currentIndex;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 15,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: AppColors.primary700,
            unselectedItemColor: AppColors.gray500,
            elevation: 0,
            selectedLabelStyle: context.textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 12.sp,
              color: AppColors.primary700,
            ),
            unselectedLabelStyle: context.textTheme.labelSmall?.copyWith(
              fontSize: 12.sp,
              color: AppColors.gray500,
            ),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, size: 24.sp),
                activeIcon: Icon(Icons.home, size: 24.sp),
                label: context.local.home,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.work_outline, size: 24.sp),
                activeIcon: Icon(Icons.work, size: 24.sp),
                label: context.local.projects,
              ),
              BottomNavigationBarItem(
                icon: _buildPaymentIcon(currentIndex == 2),
                label: context.local.payment,
              ),
              BottomNavigationBarItem(
                icon: _buildMessageIcon(currentIndex == 3),
                label: context.local.message,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined, size: 24.sp),
                activeIcon: Icon(Icons.account_circle, size: 24.sp),
                label: context.local.profile,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentIcon(bool isSelected) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Icon(
          isSelected ? Icons.credit_card : Icons.credit_card_outlined,
          size: 24.sp,
          color: isSelected ? AppColors.primary700 : AppColors.gray500,
        ),
        Positioned(
          right: -3.w,
          bottom: 3.h,
          child: Container(
            padding: const EdgeInsets.all(0.5),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.verified_user, // shield-like
              size: 10.sp,
              color: isSelected ? AppColors.primary700 : AppColors.gray500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMessageIcon(bool isSelected) {
    return Badge(
      label: Text(
        '3',
        style: TextStyle(
          fontSize: 8.sp,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: AppColors.primary700,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.5.h),
      child: Icon(
        isSelected ? Icons.chat_bubble : Icons.chat_bubble_outline,
        size: 24.sp,
        color: isSelected ? AppColors.primary700 : AppColors.gray500,
      ),
    );
  }
}

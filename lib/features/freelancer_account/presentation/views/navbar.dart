import 'package:flutter/material.dart';
import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FreelancerNavbar extends StatelessWidget {
  const FreelancerNavbar({
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
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: context.colorScheme.primary,
          unselectedItemColor: context.theme.disabledColor,
          selectedLabelStyle: context.textTheme.labelSmall?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
          ),
          unselectedLabelStyle: context.textTheme.labelSmall?.copyWith(
            fontSize: 12.sp,
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
              icon: Icon(Icons.assignment_outlined, size: 24.sp),
              activeIcon: Icon(Icons.assignment, size: 24.sp),
              label: context.local.history,
            ),
            BottomNavigationBarItem(
              icon: Badge(
                label: const Text('3'),
                child: Icon(Icons.chat_bubble_outline, size: 24.sp),
              ),
              activeIcon: Badge(
                label: const Text('3'),
                child: Icon(Icons.chat_bubble, size: 24.sp),
              ),
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
    );
  }
}

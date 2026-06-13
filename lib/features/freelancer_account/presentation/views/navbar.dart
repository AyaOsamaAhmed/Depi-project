import 'package:flutter/material.dart';
import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/home_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/projects_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/message_view.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/profile_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FreelancerNavbar extends StatefulWidget {
  const FreelancerNavbar({super.key});

  @override
  State<FreelancerNavbar> createState() => _FreelancerNavbarState();
}

class _FreelancerNavbarState extends State<FreelancerNavbar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeView(),
    const ProjectsView(),
    const MessageView(),
    const FreelancerProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
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
          currentIndex: _selectedIndex,
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
              icon: Icon(Icons.home_outlined, size: 28.sp),
              activeIcon: Icon(Icons.home, size: 28.sp),
              label: context.local.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work_outline, size: 28.sp),
              activeIcon: Icon(Icons.work, size: 28.sp),
              label: context.local.projects,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_outlined, size: 28.sp),
              activeIcon: Icon(Icons.chat, size: 28.sp),
              label: context.local.message,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline, size: 28.sp),
              activeIcon: Icon(Icons.person, size: 28.sp),
              label: context.local.profile,
            ),
          ],
        ),
      ),
    );
  }
}

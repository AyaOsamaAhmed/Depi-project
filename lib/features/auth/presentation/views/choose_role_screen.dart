import 'package:dipe_freelance/core/di/injection.dart';
import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/features/auth/presentation/states/signup/signup_cubit.dart';
import 'package:dipe_freelance/features/auth/presentation/states/signup/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ChooseRoleScreen extends StatefulWidget {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  const ChooseRoleScreen({
    super.key,
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
  });

  @override
  State<ChooseRoleScreen> createState() => _ChooseRoleScreenState();
}

class _ChooseRoleScreenState extends State<ChooseRoleScreen> {
  int _selectedIndex = -1;

  final List<Map<String, dynamic>> _roles = [
    {
      'title': "I'm a client",
      'subtitle': 'Turn your idea into reality',
      'icon': Icons.person_outline,
      'userType': 2, // Client
    },
    {
      'title': "I'm a Freelancer",
      'subtitle': 'Work your way. Earn your value.',
      'icon': Icons.person_outline,
      'userType': 1, // Freelancer
    },
    {
      'title': 'Student',
      'subtitle': 'Connecting Ideas with Experts.',
      'icon': Icons.school_outlined,
      'userType': 4, // Student
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SignupCubit>(),
      child: BlocListener<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccess) {
            final userType = _roles[_selectedIndex]['userType'] as int;
            if (userType == 2) {
              // Client
              context.go(AppRoutes.userDashboard);
            } else if (userType == 1) {
              // Freelancer
              context.go(AppRoutes.freelanceDashboard);
            } else {
              // Student
              context.go(AppRoutes.userDashboard);
            }
          }
          if (state is SignupFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Scaffold(
          backgroundColor: context.colorScheme.surface,
          appBar: AppBar(
            backgroundColor: context.colorScheme.surface,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: context.colorScheme.onSurface,
              ),
              onPressed: () => context.pop(),
            ),
            title: Text(
              'Choose your role',
              style: context.textTheme.titleLarge?.copyWith(
                color: context.colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                SizedBox(height: 16.h),
                Expanded(
                  child: ListView.separated(
                    itemCount: _roles.length,
                    separatorBuilder: (_, __) => SizedBox(height: 12.h),
                    itemBuilder: (context, index) {
                      final role = _roles[index];
                      final isSelected = _selectedIndex == index;
                      return GestureDetector(
                        onTap: () => setState(() => _selectedIndex = index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? context.colorScheme.primary.withOpacity(0.08)
                                : context.colorScheme.surface,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: isSelected
                                  ? context.colorScheme.primary
                                  : Colors.grey.withOpacity(0.2),
                              width: 1.5,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 48.w,
                                height: 48.h,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? context.colorScheme.primary
                                      : context.colorScheme.primary.withOpacity(
                                          0.08,
                                        ),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  role['icon'] as IconData,
                                  color: isSelected
                                      ? context.colorScheme.onPrimary
                                      : context.colorScheme.primary,
                                  size: 24.sp,
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    role['title'] as String,
                                    style: context.textTheme.bodyLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: context.colorScheme.onSurface,
                                        ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    role['subtitle'] as String,
                                    style: context.textTheme.bodySmall
                                        ?.copyWith(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16.h),
                BlocBuilder<SignupCubit, SignupState>(
                  builder: (context, state) {
                    final isLoading = state is SignupLoading;
                    return SizedBox(
                      width: double.infinity,
                      height: 56.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: context.colorScheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        onPressed: _selectedIndex == -1 || isLoading
                            ? null
                            : () {
                                final userType =
                                    _roles[_selectedIndex]['userType'] as int;
                                context.read<SignupCubit>().register(
                                  email: widget.email,
                                  password: widget.password,
                                  firstName: widget.firstName,
                                  lastName: widget.lastName,
                                  userType: userType,
                                );
                              },
                        child: isLoading
                            ? SizedBox(
                                height: 24.h,
                                width: 24.w,
                                child: CircularProgressIndicator(
                                  color: context.colorScheme.onPrimary,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                'Continue',
                                style: context.textTheme.labelLarge?.copyWith(
                                  color: context.colorScheme.onPrimary,
                                  fontSize: 16.sp,
                                ),
                              ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

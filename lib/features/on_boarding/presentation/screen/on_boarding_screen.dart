import 'package:dipe_freelance/core/di/injection.dart';
import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController controller = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onDone(BuildContext context) async {
    await getIt<AuthLocalDataSource>().saveOnBoardingSeen();
    if (context.mounted) {
      context.go(AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            final screenWidth = MediaQuery.sizeOf(context).width;
            final newIndex = (notification.metrics.pixels / screenWidth)
                .round();
            if (newIndex != currentIndex && newIndex >= 0 && newIndex < 2) {
              setState(() {
                currentIndex = newIndex;
              });
            }
          }
          return false;
        },
        child: PageView.builder(
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return _buildScreenOne(context);
            } else {
              return _buildScreenTwo(context);
            }
          },
        ),
      ),
    );
  }

  // Screen 1: Welcome to NEXT HIRE
  Widget _buildScreenOne(BuildContext context) {
    return Column(
      children: [
        // TOP IMAGE AREA
        Expanded(
          flex: 5,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: SvgPicture.asset(
                    'assets/images/onboarding_back_1.svg',
                    height: 327.h,
                    width: 1.sw,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/onboarding_1.png',
                  width: 1.sw,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        // BOTTOM TEXT & BUTTONS AREA
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildIndicator(0, context),
                SizedBox(height: 32.h),
                _buildWelcomeTitle(context),
                SizedBox(height: 48.h),
                _buildPrimaryButton(
                  context,
                  text: context.local.onboardingStartBtn,
                  onPressed: () {
                    controller.animateTo(
                      MediaQuery.sizeOf(context).width,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInToLinear,
                    );
                  },
                ),
                SizedBox(height: 16.h),
                _buildOutlinedButton(
                  context,
                  text: context.local.onboardingSkipBtn,
                  onPressed: () => _onDone(context),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Screen 2: Your Freelance Future Starts Here
  Widget _buildScreenTwo(BuildContext context) {
    return Column(
      children: [
        // TOP TEXT & BUTTON AREA
        Expanded(
          flex: 5,
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildIndicator(1, context),
                  SizedBox(height: 32.h),
                  Text(
                    context.local.onboardingFutureTitle,
                    textAlign: TextAlign.center,
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    context.local.onboardingFutureDesc,
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontSize: 14.sp,
                      color: context.colorScheme.onSurface.withValues(
                        alpha: 0.7,
                      ),
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 48.h),
                  _buildPrimaryButton(
                    context,
                    text: context.local.onboardingNextBtn,
                    onPressed: () => _onDone(context),
                  ),
                ],
              ),
            ),
          ),
        ),
        // BOTTOM IMAGE AREA
        Expanded(
          flex: 5,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: SvgPicture.asset(
                    'assets/images/onboarding_back_2.svg',
                    height: 327.h,
                    width: 1.sw,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned.fill(
                child: Image.asset(
                  'assets/images/onboarding_2.png',
                  // height: 800.h,
                  alignment: AlignmentGeometry.bottomCenter,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWelcomeTitle(BuildContext context) {
    final title = context.local.onboardingWelcomeTitle;
    if (title.contains('NEXT HIRE')) {
      final parts = title.split('NEXT HIRE');
      return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: context.textTheme.headlineSmall?.copyWith(
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
            color: context.colorScheme.onSurface,
          ),
          children: [
            TextSpan(text: parts[0]),
            TextSpan(
              text: 'NEXT ',
              style: TextStyle(
                color: context.colorScheme.primary,
                fontWeight: FontWeight.w800,
              ),
            ),
            TextSpan(
              text: 'HIRE',
              style: TextStyle(
                color: context.colorScheme.secondary,
                fontWeight: FontWeight.w800,
              ),
            ),
            if (parts.length > 1) TextSpan(text: parts[1]),
          ],
        ),
      );
    }
    return Text(
      title,
      textAlign: TextAlign.center,
      style: context.textTheme.headlineSmall?.copyWith(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: context.colorScheme.onSurface,
      ),
    );
  }

  Widget _buildIndicator(int activeIndex, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(2, (index) {
        final isActive = index == activeIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          width: 8.w,
          height: isActive ? 20.h : 8.h,
          decoration: BoxDecoration(
            color: isActive
                ? context.colorScheme.primary
                : const Color(0xFFD1D5DB), // gray300
            borderRadius: BorderRadius.circular(4.r),
          ),
        );
      }),
    );
  }

  Widget _buildPrimaryButton(
    BuildContext context, {
    required String text,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: context.colorScheme.primary,
          foregroundColor: context.colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
          ),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: context.textTheme.labelLarge?.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: context.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }

  Widget _buildOutlinedButton(
    BuildContext context, {
    required String text,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: context.colorScheme.primary, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
          ),
          foregroundColor: context.colorScheme.primary,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: context.textTheme.labelLarge?.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: context.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}

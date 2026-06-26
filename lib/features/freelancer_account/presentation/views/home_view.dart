import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/freelancer_cubit.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/freelancer_state.dart';
import 'package:dipe_freelance/core/di/injection.dart';
import 'package:go_router/go_router.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<FreelancerCubit>(),
      child: BlocBuilder<FreelancerCubit, FreelancerState>(
        builder: (context, state) {
          if (state is FreelancerLoading) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          return Scaffold(
            backgroundColor: context.colorScheme.surface,
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _HomeHeader(),
                    SizedBox(height: 24.h),
                    const _AIScoreCard(),
                    SizedBox(height: 24.h),
                    const _QuickActionsGrid(),
                    SizedBox(height: 32.h),
                    const _SectionHeader(titleKey: 'recommendedForYou'),
                    SizedBox(height: 16.h),
                    const _RecommendedSection(),
                    SizedBox(height: 32.h),
                    const _SectionHeader(titleKey: 'recentActivity'),
                    SizedBox(height: 16.h),
                    const _RecentActivitySection(),
                    SizedBox(height: 32.h),
                    const _UpgradeCard(),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(Icons.menu, color: context.colorScheme.onSurface),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '${context.local.hello}, Sarah',
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text('👋', style: TextStyle(fontSize: 18.sp)),
                ],
              ),
              Text(
                'Ready to grow your career?',
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurface.withOpacity(0.6),
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => context.push(AppRoutes.notifications),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(Icons.notifications_none_outlined,
                    color: context.colorScheme.onSurface),
              ),
              Positioned(
                right: -2.w,
                top: -2.h,
                child: Container(
                  padding: EdgeInsets.all(4.r),
                  decoration: const BoxDecoration(
                    color: Color(0xFF0D2C54),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AIScoreCard extends StatelessWidget {
  const _AIScoreCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF030D31),
            Color(0xFF0D2C54),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Background pattern placeholder (can be improved with SVG if available)
          Positioned(
            right: -20,
            top: -20,
            child: Opacity(
              opacity: 0.1,
              child: Icon(Icons.grid_4x4, size: 100.r, color: Colors.white),
            ),
          ),
          Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 70.r,
                    height: 70.r,
                    child: CircularProgressIndicator(
                      value: 0.85,
                      strokeWidth: 6.r,
                      backgroundColor: Colors.white.withOpacity(0.1),
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '85',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '/100',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'AI profile score',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'Great job!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      context.local.completeProfileDesc,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    InkWell(
                      onTap: () => context.push(AppRoutes.analytics),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              context.local.improveProfile,
                              style: TextStyle(
                                color: const Color(0xFF0D2C54),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Icon(Icons.chevron_right,
                                size: 14.r, color: const Color(0xFF0D2C54)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickActionsGrid extends StatelessWidget {
  const _QuickActionsGrid();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _QuickActionCard(
          icon: Icons.account_balance_wallet_outlined,
          label: context.local.wallet,
          value: r'$1.250',
          iconColor: const Color(0xFFF2994A),
          onTap: () => context.push(AppRoutes.payment),
        ),
        _QuickActionCard(
          icon: Icons.description_outlined,
          label: context.local.proposals,
          value: '5 Pending',
          iconColor: const Color(0xFFF2994A),
        ),
        _QuickActionCard(
          icon: Icons.grid_view_sharp,
          label: context.local.projects,
          value: '12News',
          iconColor: const Color(0xFFF2994A),
          onTap: () => context.go(AppRoutes.projects),
        ),
      ],
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color iconColor;
  final VoidCallback? onTap;

  const _QuickActionCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 105.w,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: const Color(0xFFFDF0E5),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(icon, color: iconColor, size: 24.r),
            ),
            SizedBox(height: 12.h),
            Text(
              label,
              style: context.textTheme.labelSmall?.copyWith(
                color: const Color(0xFF0D2C54),
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              value,
              style: context.textTheme.labelSmall?.copyWith(
                color: const Color(0xFF0D2C54).withOpacity(0.6),
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String titleKey;

  const _SectionHeader({required this.titleKey});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titleKey == 'recommendedForYou' ? context.local.recommendedForYou : context.local.recentActivity,
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            context.local.viewAll,
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ),
      ],
    );
  }
}

class _RecommendedSection extends StatelessWidget {
  const _RecommendedSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _JobCard(
          title: 'UI/UX Design for Mobile App',
          client: 'creative studio',
          price: '\$1,200',
          daysLeft: '5',
          matchPercent: '90',
          isFeatured: true,
        ),
        SizedBox(height: 16.h),
        const _JobCard(
          title: 'UI/UX Design for Mobile App',
          client: 'creative studio',
          price: '\$1,200',
          daysLeft: '5',
          matchPercent: '90',
          isFeatured: true,
        ),
      ],
    );
  }
}

class _JobCard extends StatelessWidget {
  final String title;
  final String client;
  final String price;
  final String daysLeft;
  final String matchPercent;
  final bool isFeatured;

  const _JobCard({
    required this.title,
    required this.client,
    required this.price,
    required this.daysLeft,
    required this.matchPercent,
    required this.isFeatured,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(AppRoutes.jobDetails),
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFigmaIcon(),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1B1B1B),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Text(
                            'Client:$client',
                            style: context.textTheme.labelSmall?.copyWith(
                              color: const Color(0xFF828282),
                              fontSize: 10.sp,
                            ),
                          ),
                          if (isFeatured) ...[
                            SizedBox(width: 8.w),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE8F5E9),
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: Text(
                                'Featured',
                                style: TextStyle(
                                  color: const Color(0xFF2E7D32),
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(Icons.bookmark_border, color: const Color(0xFF1B1B1B), size: 24.r),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Text(
                  price,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1B1B1B),
                  ),
                ),
                SizedBox(width: 12.w),
                Text(
                  '$daysLeft Days Left',
                  style: context.textTheme.labelSmall?.copyWith(
                    color: const Color(0xFF828282),
                  ),
                ),
                const Spacer(),
                Text(
                  '$matchPercent% Match',
                  style: context.textTheme.labelSmall?.copyWith(
                    color: const Color(0xFF828282),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Expanded(
                  child: Wrap(
                    runSpacing: 4.h,
                    children: const [
                      _TagChip('UI/X Designer'),
                      _TagChip('Figma'),
                      _TagChip('Mobile App'),
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                SizedBox(
                  width: 70.w,
                  height: 4.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(2.r),
                    child: LinearProgressIndicator(
                      value: double.parse(matchPercent) / 100,
                      backgroundColor: const Color(0xFFE0E0E0),
                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF0D2C54)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFigmaIcon() {
    return Container(
      width: 50.r,
      height: 50.r,
      decoration: BoxDecoration(
        color: const Color(0xFF1B1B1B),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Simplified Figma-like visual
             Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                 Row(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                    _figmaDot(Colors.red),
                    _figmaDot(Colors.purple),
                   ],
                 ),
                 Row(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                    _figmaDot(Colors.blue),
                    _figmaDot(Colors.green),
                   ],
                 ),
               ],
             ),
          ],
        ),
      ),
    );
  }

  Widget _figmaDot(Color color) {
    return Container(
      width: 8.r,
      height: 8.r,
      margin: EdgeInsets.all(1.r),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  final String label;

  const _TagChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: context.colorScheme.onSurface.withOpacity(0.05),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: context.colorScheme.onSurface.withOpacity(0.4),
          fontSize: 8.sp,
        ),
      ),
    );
  }
}

class _RecentActivitySection extends StatelessWidget {
  const _RecentActivitySection();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(AppRoutes.chat),
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24.r,
              backgroundImage: const NetworkImage('https://i.pravatar.cc/150?u=a042581f4e29026704d'),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Manuella Beshara',
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Send you a message about your proposal',
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.colorScheme.onSurface.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '10m ago',
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.onSurface.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: 4.h),
                Container(
                  width: 8.r,
                  height: 8.r,
                  decoration: BoxDecoration(
                    color: context.colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _UpgradeCard extends StatelessWidget {
  const _UpgradeCard();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: const Color(0xFF0D2C54).withOpacity(0.15),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: const Color(0xFF0D2C54).withOpacity(0.2),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(Icons.workspace_premium, color: const Color(0xFF0D2C54), size: 30.r),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Upgrade to pro',
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF0D2C54),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Get more visabilty and better opportunities',
                    style: context.textTheme.labelSmall?.copyWith(
                      color: const Color(0xFF0D2C54).withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: const Color(0xFF0D2C54)),
          ],
        ),
      ),
    );
  }
}

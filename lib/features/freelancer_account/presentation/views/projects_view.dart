import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dipe_freelance/core/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/jobs_cubit.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/jobs_state.dart';
import 'package:dipe_freelance/features/freelancer_account/domain/entities/project_entity.dart';
import 'package:dipe_freelance/features/freelancer_account/domain/entities/category_entity.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/core/di/injection.dart';
import 'package:go_router/go_router.dart';

class ProjectsView extends StatefulWidget {
  const ProjectsView({super.key});

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<JobsCubit>()..loadJobs(),
      child: Scaffold(
        backgroundColor: context.colorScheme.surface,
        body: SafeArea(
          child: BlocBuilder<JobsCubit, JobsState>(
            builder: (context, state) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.local.findYourNextProject,
                      style: context.textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 28.sp,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    // Search Bar
                    _SearchBar(
                      controller: _searchController,
                      onChanged: (query) {
                        context.read<JobsCubit>().searchJobs(query);
                      },
                    ),
                    SizedBox(height: 24.h),
                    // Categories
                    if (state is JobsLoaded && state.categories.isNotEmpty)
                      _CategoryChips(categories: state.categories),
                    if (state is JobsLoaded && state.categories.isNotEmpty)
                      SizedBox(height: 32.h),
                    // Projects List
                    if (state is JobsLoading)
                      const Center(child: CircularProgressIndicator()),
                    if (state is JobsError)
                      Center(
                        child: Column(
                          children: [
                            SizedBox(height: 40.h),
                            Icon(
                              Icons.error_outline,
                              size: 64.r,
                              color: Colors.red.withOpacity(0.5),
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              state.message,
                              textAlign: TextAlign.center,
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: Colors.red,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            ElevatedButton(
                              onPressed: () =>
                                  context.read<JobsCubit>().loadJobs(),
                              child: const Text('Try Again'),
                            ),
                          ],
                        ),
                      ),
                    if (state is JobsLoaded)
                      _ProjectsList(projects: state.projects),
                    SizedBox(height: 32.h),
                    const _WalletCard(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const _SearchBar({required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: context.colorScheme.onSurface.withOpacity(0.2),
        ),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            Icons.search,
            color: context.colorScheme.onSurface.withOpacity(0.5),
          ),
          hintText: context.local.searchPlaceholder,
          hintStyle: TextStyle(
            color: context.colorScheme.onSurface.withOpacity(0.5),
          ),
          border: InputBorder.none,
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    controller.clear();
                    onChanged('');
                  },
                )
              : null,
        ),
      ),
    );
  }
}

class _CategoryChips extends StatelessWidget {
  final List<CategoryEntity> categories;

  const _CategoryChips({required this.categories});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          // All chip
          Container(
            margin: EdgeInsets.only(right: 12.w),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.secondary200,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              context.local.all,
              style: context.textTheme.labelMedium?.copyWith(
                color: AppColors.secondary700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Dynamic categories from API
          ...categories.map(
            (cat) => Container(
              margin: EdgeInsets.only(right: 12.w),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: context.colorScheme.onSurface.withOpacity(0.08),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                cat.nameEn,
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.onSurface,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectsList extends StatelessWidget {
  final List<ProjectEntity> projects;

  const _ProjectsList({required this.projects});

  @override
  Widget build(BuildContext context) {
    if (projects.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h),
          child: Column(
            children: [
              Icon(
                Icons.search_off,
                size: 64.r,
                color: context.colorScheme.onSurface.withOpacity(0.2),
              ),
              SizedBox(height: 16.h),
              Text(
                context.local.noResultsFound,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onSurface.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: projects.length,
        separatorBuilder: (context, index) => Divider(
          height: 32.h,
          color: context.colorScheme.onSurface.withOpacity(0.1),
        ),
        itemBuilder: (context, index) {
          return _ProjectItem(project: projects[index]);
        },
      ),
    );
  }
}

class _ProjectItem extends StatelessWidget {
  final ProjectEntity project;

  const _ProjectItem({required this.project});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(AppRoutes.jobDetails, extra: project.id),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  project.title,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                project.priceRange,
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: AppColors.secondary200,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              context.local.fixedPrices,
              style: TextStyle(
                color: AppColors.secondary700,
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${context.local.experienceLevel}: ${project.experienceLevel}',
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.onSurface.withOpacity(0.5),
                ),
              ),
              Text(
                project.createdAt,
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.onSurface.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _WalletCard extends StatelessWidget {
  const _WalletCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: context.colorScheme.primary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.local.walletTab,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            context.local.manageEverything,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.local.currentBalance,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '\$3000',
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.colorScheme.primary,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: AppColors.secondary200,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    Icon(Icons.add, color: AppColors.secondary700, size: 20.sp),
                    SizedBox(width: 4.w),
                    Text(
                      context.local.addFunds,
                      style: context.textTheme.labelMedium?.copyWith(
                        color: AppColors.secondary700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              children: [
                _WalletInfoItem(
                  icon: Icons.verified_user_outlined,
                  label: context.local.safeSecure,
                ),
                SizedBox(width: 12.w),
                _WalletInfoItem(
                  icon: Icons.credit_card_outlined,
                  label: context.local.multiplePaymentMethods,
                ),
                SizedBox(width: 12.w),
                _WalletInfoItem(
                  icon: Icons.lock_outline,
                  label: context.local.securePayments,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WalletInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _WalletInfoItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 14.sp,
          color: context.colorScheme.onSurface.withOpacity(0.6),
        ),
        SizedBox(width: 4.w),
        Text(
          label,
          style: TextStyle(
            fontSize: 8.sp,
            color: context.colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}

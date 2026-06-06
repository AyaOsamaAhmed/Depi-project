import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dipe_freelance/core/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/project_cubit.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/project_state.dart';

class ProjectModel {
  final String title;
  final String price;
  final String experienceLevel;
  final String time;

  ProjectModel({
    required this.title,
    required this.price,
    required this.experienceLevel,
    required this.time,
  });
}

class ProjectsView extends StatefulWidget {
  const ProjectsView({super.key});

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  final List<ProjectModel> _allProjects = [
    ProjectModel(
      title: 'Mobile App Design',
      price: '\$1,500',
      experienceLevel: 'Intermediate',
      time: '3h Ago',
    ),
    ProjectModel(
      title: 'UI/UX Dashboard',
      price: '\$800',
      experienceLevel: 'Expert',
      time: '1h Ago',
    ),
    ProjectModel(
      title: 'Website Redesign',
      price: '\$2,000',
      experienceLevel: 'Entry',
      time: '5h Ago',
    ),
    ProjectModel(
      title: 'Flutter App Development',
      price: '\$3,500',
      experienceLevel: 'Intermediate',
      time: '10m Ago',
    ),
  ];

  List<ProjectModel> _filteredProjects = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredProjects = _allProjects;
  }

  void _filterProjects(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredProjects = _allProjects;
      } else {
        _filteredProjects = _allProjects
            .where((project) =>
                project.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectCubit, ProjectState>(
      builder: (context, state) {
        if (state is ProjectLoading) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        return Scaffold(
          backgroundColor: context.colorScheme.surface,
          body: SafeArea(
            child: SingleChildScrollView(
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
                  _SearchBar(
                    controller: _searchController,
                    onChanged: _filterProjects,
                  ),
                  SizedBox(height: 24.h),
                  const _FilterChips(),
                  SizedBox(height: 32.h),
                  _ProjectsList(projects: _filteredProjects),
                ],
              ),
            ),
          ),
        );
      },
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

class _FilterChips extends StatelessWidget {
  const _FilterChips();

  @override
  Widget build(BuildContext context) {
    final categories = [
      'all',
      'uiuxDesign',
      'mobileAppDesign',
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: categories.asMap().entries.map((entry) {
          final isFirst = entry.key == 0;
          final key = entry.value;
          return Container(
            margin: EdgeInsets.only(right: 12.w),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: isFirst
                  ? AppColors.secondary200 // Peach color for "All"
                  : context.colorScheme.onSurface.withOpacity(0.08),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              _getLocalizedValue(context, key),
              style: context.textTheme.labelMedium?.copyWith(
                color: isFirst
                    ? AppColors.secondary700
                    : context.colorScheme.onSurface,
                fontWeight: isFirst ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  String _getLocalizedValue(BuildContext context, String key) {
    switch (key) {
      case 'all':
        return context.local.all;
      case 'uiuxDesign':
        return context.local.uiuxDesign;
      case 'webDevelopment':
        return context.local.webDevelopment;
      case 'mobileAppDesign':
        return context.local.mobileAppDesign;
      default:
        return key;
    }
  }
}

class _ProjectsList extends StatelessWidget {
  final List<ProjectModel> projects;

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
  final ProjectModel project;

  const _ProjectItem({required this.project});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              project.title,
              style: context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              project.price,
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
              project.time,
              style: context.textTheme.labelSmall?.copyWith(
                color: context.colorScheme.onSurface.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

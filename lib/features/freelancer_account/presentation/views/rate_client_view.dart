import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/project_cubit.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/project_state.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:go_router/go_router.dart';

import 'package:dipe_freelance/core/di/injection.dart';

class RateClientView extends StatefulWidget {
  final String? clientImageUrl;
  final String clientName;

  const RateClientView({
    super.key,
    this.clientImageUrl,
    this.clientName = 'Sarah Ibrahim',
  });

  @override
  State<RateClientView> createState() => _RateClientViewState();
}

class _RateClientViewState extends State<RateClientView> {
  int _rating = 0;
  final TextEditingController _reviewController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _reviewController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<ProjectCubit>(),
      child: BlocConsumer<ProjectCubit, ProjectState>(
      listener: (context, state) {
        if (state is RatingSuccess) {
          context.push(AppRoutes.finishProject);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.colorScheme.surface,
          appBar: AppBar(
            backgroundColor: context.colorScheme.surface,
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            centerTitle: true,
            title: Text(
              context.local.rateClient,
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 65.r,
                  backgroundColor: context.colorScheme.surface,
                  backgroundImage: widget.clientImageUrl != null
                      ? NetworkImage(widget.clientImageUrl!)
                      : const NetworkImage('https://ui-avatars.com/api/?name=Sarah+Ibrahim&background=0D2C54&color=fff') as ImageProvider,
                  onBackgroundImageError: (exception, stackTrace) {
                    // Fallback logic if image fails to load
                  },
                ),
                SizedBox(height: 24.h),
                Text(
                  widget.clientName,
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 12.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Text(
                    context.local.rateExperience(widget.clientName.split(' ')[0]),
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: context.colorScheme.onSurface.withOpacity(0.5),
                      height: 1.5,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                _buildStarRating(),
                SizedBox(height: 48.h),
                _buildReviewSection(),
                SizedBox(height: 48.h),
                _buildSubmitButton(context, state),
              ],
            ),
          ),
        );
      },
    ),
  );
}


  Widget _buildStarRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () => setState(() => _rating = index + 1),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Icon( index < _rating ? Icons.star_rounded : Icons.star_outline_rounded,
              color: const Color(0xFF0B2647),
              size: 44.r,
            ),
          ),
        );
      }),
    );
  }

  Widget _buildReviewSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              context.local.writeReview,
              style: context.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 4.w),
            Text(
              '(${context.local.optional})',
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.onSurface.withOpacity(0.4),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Container(
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: context.colorScheme.onSurface.withOpacity(0.2),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: _reviewController,
                maxLines: 5,
                maxLength: 200,
                decoration: InputDecoration(
                  hintText: context.local.writeReview,
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: context.colorScheme.onSurface.withOpacity(0.4),
                  ),
                  contentPadding: EdgeInsets.all(16.r),
                  border: InputBorder.none,
                  counterText: '',
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.r),
                child: Text(
                  '${_reviewController.text.length}/200',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: context.colorScheme.onSurface.withOpacity(0.4),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton(BuildContext context, ProjectState state) {
    return ElevatedButton(
      onPressed: state is RatingInProgress || _rating == 0
          ? null
          : () {
              context.read<ProjectCubit>().submitRating(_rating);
            },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary700,
        minimumSize: Size(double.infinity, 56.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        elevation: 0,
      ),
      child: state is RatingInProgress
          ? const CircularProgressIndicator(color: Colors.white)
          : Text(
              context.local.submitReview,
              style: context.textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
    );
  }

}

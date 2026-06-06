import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/project_cubit.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/project_state.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/views/work_approved_view.dart';

class SubmitWorkView extends StatefulWidget {
  const SubmitWorkView({super.key});

  @override
  State<SubmitWorkView> createState() => _SubmitWorkViewState();
}

class _SubmitWorkViewState extends State<SubmitWorkView> {
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _descriptionController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectCubit, ProjectState>(
      listener: (context, state) {
        if (state is WorkSubmitSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WorkApprovedView()),
          );
        }
      },
      child: Scaffold(
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
            context.local.submitWork,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader(context.local.milestone),
              SizedBox(height: 12.h),
              Text(
                'Homepage Design',
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(height: 32.h),
              _buildSectionHeader(context.local.deliverables),
              SizedBox(height: 12.h),
              _buildDeliverableItem(
                fileName: 'Homepage_Design.fig',
                fileSize: '2.4 MB',
              ),
              SizedBox(height: 16.h),
              _buildAddMoreFiles(),
              SizedBox(height: 32.h),
              _buildSectionHeader(context.local.description),
              SizedBox(height: 12.h),
              _buildDescriptionField(),
              SizedBox(height: 48.h),
              BlocBuilder<ProjectCubit, ProjectState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: state is WorkSubmitting
                        ? null
                        : () {
                            context.read<ProjectCubit>().submitWork();
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary700,
                      minimumSize: Size(double.infinity, 56.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      elevation: 0,
                    ),
                    child: state is WorkSubmitting
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                            context.local.submitForReview,
                            style: context.textTheme.titleMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: context.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 18.sp,
      ),
    );
  }

  Widget _buildDeliverableItem({
    required String fileName,
    required String fileSize,
  }) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xFFEBF2FF), // Soft light blue from mockup
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E), // Dark background for the icon
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.architecture_rounded,
              color: Colors.white,
              size: 24.r,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fileName,
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF0B2647),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  fileSize,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF0B2647).withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.download_rounded,
            color: const Color(0xFF0B2647),
            size: 24.r,
          ),
        ],
      ),
    );
  }

  Widget _buildAddMoreFiles() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: const Color(0xFFFFE5D0), // Soft orange background
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(
            Icons.insert_drive_file_outlined,
            color: const Color(0xFFE67E22),
            size: 20.r,
          ),
        ),
        SizedBox(width: 12.w),
        Text(
          context.local.addMoreFiles,
          style: TextStyle(
            color: const Color(0xFFE67E22),
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionField() {
    return Container(
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
            controller: _descriptionController,
            maxLines: 5,
            maxLength: 200,
            decoration: InputDecoration(
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
              '${_descriptionController.text.length}/200',
              style: TextStyle(
                fontSize: 12.sp,
                color: context.colorScheme.onSurface.withOpacity(0.4),
              ),
            ),
          ),
        ],
      ),
    );
  }

}

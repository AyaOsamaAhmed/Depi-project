import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/widgets/profile_image_picker.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/widgets/freelancer_text_field.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/widgets/skill_chip.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/freelancer_cubit.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/freelancer_state.dart';

class FreelancerProfileView extends StatefulWidget {
  const FreelancerProfileView({super.key});

  @override
  State<FreelancerProfileView> createState() => _FreelancerProfileViewState();
}

class _FreelancerProfileViewState extends State<FreelancerProfileView> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FreelancerCubit, FreelancerState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              context.local.completeProfileTitle,
              style: context.textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileImagePicker(
                  imageUrl: '',
                  imageFile: _imageFile,
                  onPickImage: _pickImage,
                ),
                SizedBox(height: 32.h),

                // Full Name
                _buildLabel(context, context.local.fullNameLabel),
                SizedBox(height: 8.h),
                const FreelancerTextField(text: 'Menna Sameh', hint: 'Your Name',),
                SizedBox(height: 24.h),

                // Title
                _buildLabel(context, context.local.titleLabel),
                SizedBox(height: 8.h),
                const FreelancerTextField(text: 'UI/UX Designer', hint: 'Your Title',),
                SizedBox(height: 24.h),

                // Monthly Rate
                _buildLabel(context, context.local.monthlyRateLabel),
                SizedBox(height: 8.h),
                const FreelancerTextField(text: '\$25/hour', hint: 'Your Rate',),
                SizedBox(height: 24.h),

                // Skills
                _buildLabel(context, context.local.skills),
                SizedBox(height: 8.h),
                Wrap(
                  children: [
                    const SkillChip(label: 'UI Design'),
                    const SkillChip(label: 'UX Design'),
                    const SkillChip(label: 'Figma'),
                    SkillChip(
                      label: context.local.addSkillLabel,
                      isAddButton: true,
                    ),
                  ],
                ),
                SizedBox(height: 48.h),

                // Save Button
                SizedBox(
                  width: double.infinity,
                  height: 56.h,
                  child: ElevatedButton(
                    onPressed: state is FreelancerLoading
                        ? null
                        : () {
                            // Update profile logic
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.colorScheme.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: state is FreelancerLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                            context.local.saveChangesButton,
                            style: context.textTheme.labelLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLabel(BuildContext context, String text) {
    return Text(
      text,
      style: context.textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.w600,
        color: context.colorScheme.onSurface,
      ),
    );
  }
}

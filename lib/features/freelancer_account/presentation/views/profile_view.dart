import 'dart:io';
import 'package:dipe_freelance/core/theme/app_colors.dart';
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
import 'package:dipe_freelance/core/di/injection.dart';
import 'package:go_router/go_router.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';

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
    return BlocProvider(
      create: (context) => getIt<FreelancerCubit>(),
      child: BlocBuilder<FreelancerCubit, FreelancerState>(
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
                  const FreelancerTextField(hint: 'Your Name'),
                  SizedBox(height: 24.h),

                  // Title
                  _buildLabel(context, context.local.titleLabel),
                  SizedBox(height: 8.h),
                  const FreelancerTextField(hint: 'Your Title'),
                  SizedBox(height: 24.h),

                  // Monthly Rate
                  _buildLabel(context, context.local.monthlyRateLabel),
                  SizedBox(height: 8.h),
                  const FreelancerTextField(hint: 'Your Rate'),
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
                  SizedBox(height: 32.h),
                  const _WalletCard(),
                ],
              ),
            ),
          );
        },
      ),
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
            children: [
              Expanded(
                child: Column(
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
              ),
              Flexible(
                child: InkWell(
                  onTap: () => context.push(AppRoutes.funds),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.secondary200,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.add,
                          color: AppColors.secondary700,
                          size: 20.sp,
                        ),
                        SizedBox(width: 4.w),
                        Flexible(
                          child: Text(
                            context.local.addFunds,
                            style: context.textTheme.labelMedium?.copyWith(
                              color: AppColors.secondary700,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _WalletInfoItem(
                  icon: Icons.verified_user_outlined,
                  label: context.local.safeSecure,
                ),
              ),
              SizedBox(width: 4.w),
              Expanded(
                child: _WalletInfoItem(
                  icon: Icons.credit_card_outlined,
                  label: context.local.multiplePaymentMethods,
                ),
              ),
              SizedBox(width: 4.w),
              Expanded(
                child: _WalletInfoItem(
                  icon: Icons.lock_outline,
                  label: context.local.securePayments,
                ),
              ),
            ],
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 14.sp,
          color: context.colorScheme.onSurface.withOpacity(0.6),
        ),
        SizedBox(width: 4.w),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 8.sp,
              color: context.colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ),
      ],
    );
  }
}

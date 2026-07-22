import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dipe_freelance/core/di/injection.dart';
import 'package:dipe_freelance/features/client/present/states/client_profile_cubit.dart';
import 'package:dipe_freelance/features/client/present/states/client_profile_state.dart';

class ClientProfileView extends StatelessWidget {
  const ClientProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ClientProfileCubit>()..loadProfile(),
      child: const _ClientProfileBody(),
    );
  }
}

class _ClientProfileBody extends StatefulWidget {
  const _ClientProfileBody();

  @override
  State<_ClientProfileBody> createState() => _ClientProfileBodyState();
}

class _ClientProfileBodyState extends State<_ClientProfileBody> {
  final _nameController = TextEditingController();
  final _companyController = TextEditingController();
  final _emailController = TextEditingController();
  final _locationController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _companyController.dispose();
    _emailController.dispose();
    _locationController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClientProfileCubit, ClientProfileState>(
      listener: (context, state) {
        if (state is ClientProfileSuccess) {
          if (_nameController.text.isEmpty && state.name.isNotEmpty) {
            _nameController.text = state.name;
            _companyController.text = state.company;
            _emailController.text = state.email;
            _locationController.text = state.location;
            _phoneController.text = state.phone;
          }
        }
      },
      builder: (context, state) {
        if (state is ClientProfileLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is ClientProfileSuccess) {
          return Scaffold(
            backgroundColor: context.colorScheme.surface,
            appBar: AppBar(
              backgroundColor: context.colorScheme.surface,
              elevation: 0,
              title: Text(
                'Complete Your Profile',
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.onSurface,
                ),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.all(24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),
                  // Profile Image
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 56.r,
                          backgroundColor: Colors.grey[300],
                          child: Icon(
                            Icons.person,
                            size: 56.sp,
                            color: Colors.white,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 32.w,
                            height: 32.h,
                            decoration: BoxDecoration(
                              color: context.colorScheme.primary,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.h),
                  // Full Name
                  _buildLabel(context, 'Full Name'),
                  SizedBox(height: 8.h),
                  _buildTextField(
                    controller: _nameController,
                    hint: 'Full Name',
                  ),
                  SizedBox(height: 20.h),
                  // Company
                  _buildLabel(context, 'Company'),
                  SizedBox(height: 8.h),
                  _buildTextField(
                    controller: _companyController,
                    hint: 'Company',
                  ),
                  SizedBox(height: 20.h),
                  // Email
                  _buildLabel(context, 'Email'),
                  SizedBox(height: 8.h),
                  _buildTextField(
                    controller: _emailController,
                    hint: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20.h),
                  // Location
                  _buildLabel(context, 'Location'),
                  SizedBox(height: 8.h),
                  _buildTextField(
                    controller: _locationController,
                    hint: 'Location',
                  ),
                  SizedBox(height: 20.h),
                  // Phone Number
                  _buildLabel(context, 'Phone Number'),
                  SizedBox(height: 8.h),
                  _buildTextField(
                    controller: _phoneController,
                    hint: 'Phone Number',
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 24.h),
                  // Wallet Card
                  //  _WalletCard(balance: state.balance),
                  SizedBox(height: 32.h),
                  // Save Button
                  SizedBox(
                    width: double.infinity,
                    height: 56.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      onPressed: () {
                        context.read<ClientProfileCubit>().updateProfile(
                          name: _nameController.text,
                          company: _companyController.text,
                          email: _emailController.text,
                          location: _locationController.text,
                          phone: _phoneController.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Changes saved successfully!'),
                          ),
                        );
                      },
                      child: Text(
                        'Save Changes',
                        style: context.textTheme.labelLarge?.copyWith(
                          color: context.colorScheme.onPrimary,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  // logout Button
                  SizedBox(
                    width: double.infinity,
                    height: 56.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.colorScheme.error,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      onPressed: () {
                        context.read<ClientProfileCubit>().logout();
                        context.go(AppRoutes.login);
                      },
                      child: Text(
                        'logout',
                        style: context.textTheme.labelLarge?.copyWith(
                          color: context.colorScheme.onPrimary,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const Scaffold(
          body: Center(child: Text('Error loading profile')),
        );
      },
    );
  }

  Widget _buildLabel(BuildContext context, String text) {
    return Text(
      text,
      style: context.textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.bold,
        color: context.colorScheme.onSurface,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: context.colorScheme.onSurface.withOpacity(0.4),
        ),
        filled: true,
        fillColor: context.colorScheme.surface,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: context.colorScheme.onSurface.withOpacity(0.15),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: context.colorScheme.onSurface.withOpacity(0.15),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: context.colorScheme.primary,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}

class _WalletCard extends StatelessWidget {
  final double balance;
  const _WalletCard({required this.balance});

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
                      '\$${balance.toStringAsFixed(0)}',
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
                  onTap: () => context.push(AppRoutes.withdrawFunds),
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
                            context.local.withdrawFunds,
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

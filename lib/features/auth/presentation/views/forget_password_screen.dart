import 'package:dipe_freelance/core/di/injection.dart';
import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/features/auth/presentation/states/forgot_password/forgot_password_cubit.dart';
import 'package:dipe_freelance/features/auth/presentation/states/forgot_password/forgot_password_state.dart';
import 'package:dipe_freelance/features/auth/presentation/widgets/auth_button.dart';
import 'package:dipe_freelance/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ForgotPasswordCubit>(),
      child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state is ForgotPasswordSuccess) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.green,
                ),
              );

            context.push(
              AppRoutes.verifyEmail,
              extra: _emailController.text.trim(),
            );
          }
          if (state is ForgotPasswordFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: context.colorScheme.surface,
            appBar: AppBar(
              backgroundColor: context.colorScheme.surface,
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: context.colorScheme.onSurface,
                ),
                onPressed: () => context.pop(),
              ),
              title: Text(
                'Forget Password',
                style: context.textTheme.titleLarge?.copyWith(
                  color: context.colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: EdgeInsets.all(24.w),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 32.h),
                    // Lock Icon
                    Center(
                      child: Container(
                        width: 120.w,
                        height: 120.h,
                        decoration: BoxDecoration(
                          color: context.colorScheme.primary.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.lock_outline_rounded,
                          size: 60.sp,
                          color: context.colorScheme.primary,
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    Center(
                      child: Text(
                        'Forgot Password?',
                        style: context.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.colorScheme.onSurface,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Center(
                      child: Text(
                        "Enter your email and we'll send you\na link to reset your password.",
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    // Email Field
                    AuthTextField(
                      label: context.local.email,
                      hint: context.local.enterEmail,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      validator: (value) => value == null || value.isEmpty
                          ? 'من فضلك ادخل الإيميل'
                          : !value.contains('@')
                          ? 'إيميل غير صحيح'
                          : null,
                      onFieldSubmitted: (_) {
                        if (_formKey.currentState!.validate()) {
                          context.read<ForgotPasswordCubit>().forgotPassword(
                            _emailController.text.trim(),
                          );
                        }
                      },
                    ),
                    const Spacer(),
                    // Button
                    AuthButton(
                      text: 'Send Reset Link',
                      isLoading: state is ForgotPasswordLoading,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<ForgotPasswordCubit>().forgotPassword(
                            _emailController.text.trim(),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 24.h),
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

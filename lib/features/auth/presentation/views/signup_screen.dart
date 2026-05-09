import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dipe_freelance/features/auth/presentation/states/signup/signup_cubit.dart';
import 'package:dipe_freelance/features/auth/presentation/states/signup/signup_state.dart';
import 'package:dipe_freelance/features/auth/presentation/widgets/auth_button.dart';
import 'package:dipe_freelance/features/auth/presentation/widgets/auth_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: Scaffold(
        backgroundColor: context.colorScheme.primary, // Dark blue background
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              // Top Section
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    context.local.signUp,
                    style: context.textTheme.displayMedium?.copyWith(
                      color: context.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
              
              // Bottom Section with Form
              Expanded(
                flex: 4, // Increased to give more space and remove scroll
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: context.colorScheme.surface,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.r),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.r),
                    ),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // First Name Field
                          AuthTextField(
                            label: context.local.firstName,
                            hint: context.local.enterFirstName,
                            controller: _firstNameController,
                          ),
                          SizedBox(height: 16.h),
                          
                          // Last Name Field
                          AuthTextField(
                            label: context.local.lastName,
                            hint: context.local.enterLastName,
                            controller: _lastNameController,
                          ),
                          SizedBox(height: 16.h),

                          // Email Field
                          AuthTextField(
                            label: context.local.email,
                            hint: context.local.enterEmail,
                            controller: _emailController,
                          ),
                          SizedBox(height: 16.h),
                          
                          // Password Field
                          AuthTextField(
                            label: context.local.password,
                            hint: context.local.enterPassword,
                            isPassword: true,
                            controller: _passwordController,
                          ),
                          SizedBox(height: 32.h),
                          
                          // Sign Up Button
                          BlocConsumer<SignupCubit, SignupState>(
                            listener: (context, state) {
                              if (state is SignupSuccess) {
                                // Navigate on success
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(context.local.signupSuccess)),
                                );
                                context.go(AppRoutes.login);
                              } else if (state is SignupFailure) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(state.message)),
                                );
                              }
                            },
                            builder: (context, state) {
                              return AuthButton(
                                text: context.local.signUp,
                                isLoading: state is SignupLoading,
                                onPressed: () {
                                  if (_firstNameController.text.isEmpty || 
                                      _lastNameController.text.isEmpty || 
                                      _emailController.text.isEmpty || 
                                      _passwordController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(context.local.fillAllFields)),
                                    );
                                    return;
                                  }
                                  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                  if (!emailRegex.hasMatch(_emailController.text)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(context.local.invalidEmail)),
                                    );
                                    return;
                                  }
                                  if (_passwordController.text.length < 6) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(context.local.passwordTooShort)),
                                    );
                                    return;
                                  }
                                  context.read<SignupCubit>().signup(
                                    _firstNameController.text,
                                    _lastNameController.text,
                                    _emailController.text,
                                    _passwordController.text,
                                  );
                                },
                              );
                            },
                          ),
                          SizedBox(height: 24.h),
                          
                          // Login Link
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: '${context.local.alreadyHaveAccount} ',
                                style: context.textTheme.bodyMedium?.copyWith(
                                  color: context.colorScheme.onSurface,
                                ),
                                children: [
                                  TextSpan(
                                    text: context.local.logIn,
                                    style: context.textTheme.bodyMedium?.copyWith(
                                      color: context.colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        context.pop();
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

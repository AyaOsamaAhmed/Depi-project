import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/core/utils/validators.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../states/login/login_cubit.dart';
import '../states/login/login_state.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        backgroundColor: context.colorScheme.primary, // Dark blue background
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              // Top Section with Icon
              Expanded(
                flex: 1,
                child: Center(
                  child: Icon(
                    Icons.person_outline,
                    size: 100.w,
                    color: context.colorScheme.onPrimary,
                  ),
                ),
              ),

              // Bottom Section with Form
              Expanded(
                flex: 3,
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
                      padding: EdgeInsets.symmetric(
                        horizontal: 32.w,
                        vertical: 40.h,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title
                            Center(
                              child: Text(
                                context.local.logIn,
                                style: context.textTheme.displayMedium
                                    ?.copyWith(
                                      color: context.colorScheme.onSurface,
                                    ),
                              ),
                            ),
                            SizedBox(height: 40.h),

                            // Email Field
                            AuthTextField(
                              label: context.local.email,
                              hint: context.local.enterEmail,
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              validator: (value) =>
                                  Validators.validateEmail(context, value),
                            ),
                            SizedBox(height: 24.h),

                            // Password Field
                            AuthTextField(
                              label: context.local.password,
                              hint: context.local.enterPassword,
                              isPassword: true,
                              controller: _passwordController,
                              textInputAction: TextInputAction.done,
                              validator: (value) =>
                                  Validators.validatePassword(context, value),
                              onFieldSubmitted: (_) {
                                if (_formKey.currentState!.validate()) {
                                  context.read<LoginCubit>().login(
                                    _emailController.text,
                                    _passwordController.text,
                                  );
                                }
                              },
                            ),
                            SizedBox(height: 16.h),

                            // Forget Password
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  context.local.forgetPassword,
                                  style: context.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: context.colorScheme.onSurface,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 32.h),

                            // Login Button
                            BlocConsumer<LoginCubit, LoginState>(
                              listener: (context, state) {
                                if (state is LoginSuccess) {
                                  // Navigate to home (or show success)
                                  ScaffoldMessenger.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          context.local.loginSuccess,
                                        ),
                                      ),
                                    );
                                } else if (state is LoginFailure) {
                                  String errorMessage = state.message;
                                  if (state.message == 'invalidCredentials') {
                                    errorMessage =
                                        context.local.invalidCredentials;
                                  }
                                  ScaffoldMessenger.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(
                                      SnackBar(content: Text(errorMessage)),
                                    );
                                }
                              },
                              builder: (context, state) {
                                return AuthButton(
                                  text: context.local.logIn,
                                  isLoading: state is LoginLoading,
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<LoginCubit>().login(
                                        _emailController.text,
                                        _passwordController.text,
                                      );
                                    }
                                  },
                                );
                              },
                            ),
                            SizedBox(height: 24.h),

                            // Sign Up Link
                            Center(
                              child: RichText(
                                text: TextSpan(
                                  text: context.local.dontHaveAccount,
                                  style: context.textTheme.bodyMedium?.copyWith(
                                    color: context.colorScheme.onSurface,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: context.local.signUp,
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                            color: context.colorScheme.primary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          context.push(AppRoutes.signup);
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

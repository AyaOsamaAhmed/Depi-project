import 'package:dipe_freelance/core/di/injection.dart';
import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:dipe_freelance/core/router/app_routes.dart';
import 'package:dipe_freelance/core/utils/validators.dart';
import 'package:dipe_freelance/features/auth/presentation/states/signup/signup_cubit.dart';
import 'package:dipe_freelance/features/auth/presentation/states/signup/signup_state.dart';
import 'package:dipe_freelance/features/auth/presentation/widgets/auth_button.dart';
import 'package:dipe_freelance/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
  final _formKey = GlobalKey<FormState>();

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
      create: (context) => getIt<SignupCubit>(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor:
                context.colorScheme.primary, // Dark blue background
            body: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  // Top Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: context.colorScheme.onPrimary,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Center(
                        child: Text(
                          context.local.signUp,
                          style: context.textTheme.displayMedium?.copyWith(
                            color: context.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      SizedBox(height: 40.h),
                    ],
                  ),

                  // Bottom Section with Form
                  Expanded(
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
                            vertical: 32.h,
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // First Name Field
                                AuthTextField(
                                  label: context.local.firstName,
                                  hint: context.local.enterFirstName,
                                  controller: _firstNameController,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) =>
                                      Validators.validateRequired(
                                        context,
                                        value,
                                        context.local.firstName,
                                      ),
                                ),
                                SizedBox(height: 16.h),

                                // Last Name Field
                                AuthTextField(
                                  label: context.local.lastName,
                                  hint: context.local.enterLastName,
                                  controller: _lastNameController,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) =>
                                      Validators.validateRequired(
                                        context,
                                        value,
                                        context.local.lastName,
                                      ),
                                ),
                                SizedBox(height: 16.h),

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
                                SizedBox(height: 16.h),

                                // Password Field
                                AuthTextField(
                                  label: context.local.password,
                                  hint: context.local.enterPassword,
                                  isPassword: true,
                                  controller: _passwordController,
                                  textInputAction: TextInputAction.done,
                                  validator: (value) =>
                                      Validators.validatePassword(
                                        context,
                                        value,
                                      ),
                                  onFieldSubmitted: (_) {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<SignupCubit>().signup(
                                        firstName: _firstNameController.text,
                                        lastName: _lastNameController.text,
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                        userType: 1, // Default Freelancer
                                        gender: 1, // Default Male
                                        dateOfBirth: "2000-01-01",
                                        phoneNumber: "0123456789",
                                        countryId: 1,
                                      );
                                    }
                                  },
                                ),
                                SizedBox(height: 32.h),

                                SizedBox(
                                  width: double.infinity,
                                  child: BlocConsumer<SignupCubit, SignupState>(
                                    listener: (context, state) {
                                      if (state is SignupSuccess) {
                                        // Navigate on success
                                        ScaffoldMessenger.of(context)
                                          ..hideCurrentSnackBar()
                                          ..showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                context.local.signupSuccess,
                                              ),
                                            ),
                                          );
                                        context.push(
                                          AppRoutes.chooseRole,
                                          extra: _emailController.text,
                                        );
                                      } else if (state is SignupFailure) {
                                        ScaffoldMessenger.of(context)
                                          ..hideCurrentSnackBar()
                                          ..showSnackBar(
                                            SnackBar(
                                              content: Text(state.message),
                                            ),
                                          );
                                      }
                                    },
                                    builder: (context, state) {
                                      return AuthButton(
                                        text: context.local.signUp,
                                        isLoading: state is SignupLoading,
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            context.read<SignupCubit>().signup(
                                              firstName:
                                                  _firstNameController.text,
                                              lastName:
                                                  _lastNameController.text,
                                              email: _emailController.text,
                                              password:
                                                  _passwordController.text,
                                              userType: 1, // Default user type
                                              gender: 1, // Default Male
                                              dateOfBirth: "2000-01-01",
                                              phoneNumber: "0123456789",
                                              countryId: 1,
                                            );
                                          }
                                        },
                                      );
                                    },
                                  ),
                                ),

                                SizedBox(height: 24.h),

                                // Login Link
                                Center(
                                  child: RichText(
                                    text: TextSpan(
                                      text:
                                          '${context.local.alreadyHaveAccount} ',
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                            color:
                                                context.colorScheme.onSurface,
                                          ),
                                      children: [
                                        TextSpan(
                                          text: context.local.logIn,
                                          style: context.textTheme.bodyMedium
                                              ?.copyWith(
                                                color:
                                                    context.colorScheme.primary,
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
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
